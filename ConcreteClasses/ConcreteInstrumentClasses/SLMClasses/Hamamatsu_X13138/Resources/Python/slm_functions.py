
import typing as t
# from functools import cached_property, lru_cache
import time
from pathlib import Path

import numpy as np
from PIL import Image
from  LCOS_SLM_13138_Class import HamaSLM_13138

TWO_PI = 2 * np.pi  # Because I keep forgetting % and * precedence
UINT8_MAX = np.iinfo(np.uint8).max
UINT8_PI = (UINT8_MAX + 1) // 2
# UINT8_PER_RAD = (UINT8_MAX + 1) / TWO_PI

UINT8_PER_RAD = 255 / TWO_PI


class SlmDisplay:
    """A class for controlling a Spatial Light Modulator (SLM) display.

    This class provides an interface to manage an SLM device, connected as a
    secondary display. It allows for loading different types of patterns onto
    the SLM.

    .. warning::
        This class starts a secondary thread where the GUI loop is run. This is
        very hacky and has a number of problems. It works only on Windows,
        since Linux and macOS do not allow the GUI loop to run on a secondary
        thread. Also, it is only possible to instantiate the class once, which
        makes working with more than one SLMs impossible. The implementation of
        this class should change in the future to address these problems.

    Parameters
    ----------
    monitor : int
        The index of the monitor to use for the SLM display.
    sleep_secs : float, default 0.2
        The time to sleep after loading an SLM array, in seconds. It takes
        some time for the SLM to stabilize once an array is loaded.
        Empirically we have found that the stabilisation time is around
        150ms-200ms.
    global_array_file : str | Path | None, default None
        The path to a .bmp file containing a specific SLM array. This array is
        applied as an overlay to all arrays loaded onto the SLM. The array can
        be used for wavefront compensation. The file must contain an array of
        the same shape as the current SLM display. If ``None``, no global array
        is applied.

    Attributes
    ----------
    grating_freq : int | None
        The freq of the grating to apply on the SLM display. If None, no
        grating is applied.
    sleep_secs : float
        The time to sleep after updating the SLM array, in seconds.

    Examples
    --------
    >>> slm = SlmDisplay(monitor=1, grating_freq=1 / 50)
    >>> array = np.random.rand(500, 500) * 2 * np.pi  # create random array in [0, 2π)
    >>> slm.load_phase(array)                         # load array onto SLM
    """

    def __init__(
        self,
        monitor: int,
        modulation_depth: int,
        sleep_secs: float = 0.2,
        correction_pattern_file: str | Path | None = None,
    ) -> None:
        self.sleep_secs = sleep_secs
        self._correction_pattern_file = correction_pattern_file
        self._core = HamaSLM_13138(monitor, modulation_depth)
        self.divisions_x = 0
        self.divisions_y = 0
        self.correction_pattern: np.ndarray | None
        if correction_pattern_file is not None:
            global_img = Image.open(correction_pattern_file)
            self.correction_pattern = np.array(global_img, dtype=np.uint8)
            print(self.correction_pattern.shape)
            print(self.shape)
            if self.correction_pattern.shape != self.shape():
                msg = f"Shape mismatch between global array found in {correction_pattern_file} and current SLM display. {self.correction_pattern.shape},{self.shape()} "
                raise ValueError(msg)
        else:
            self.correction_pattern = None

        self._set_correction_pattern() 


    # @cached_property
    def shape(self) -> tuple[int, int]:
        """Get the shape (resolution) of the SLM display in (height, width) format."""
        # Displays use (X, Y) to represent their resolution or size. When numpy
        # arrays are used as images their shape corresponds to a (Y, X)
        # representation since  shape[0] is the number of rows and shape[1] the
        # number of columns. To simplify things the `shape` property takes care
        # of inverting the SLM's size.
        res_x, res_y = self._core.getSize()
        return (res_y, res_x)

    def _set_correction_pattern(self) -> None:
        
        if self.correction_pattern is not None:
            array = self.correction_pattern
        else:
            array = np.zeros(self.shape, dtype=np.uint8)
        self._core.updateArray(array)
        time.sleep(self.sleep_secs)

    


    def load_phase(self, phase: np.ndarray) -> None:
        """Load a phase array onto the SLM display.

        Parameters
        ----------
        phase : np.ndarray
            The phase array to be displayed on the SLM. All array values must
            be in [0, 2π).
        """
        array = phase_to_uint8(phase)
        
        # The array to be displayed on the SLM. All array values must be in
        # [0, 255],that is the result of phase_to_uint8.
        
        array = self._make_full_slm_array(array, self.divisions_x, self.divisions_y)

        # We need to sleep after updating the SLM because of the rise time of
        # liquid crystals. However, slmPy sleeps before updating so we need to
        # set its sleep time to 0, and have a sleep time AFTER the update.
        self._core.updateArray(array)
        time.sleep(self.sleep_secs)
        return array


    def _make_full_slm_array(self, array, divisions_x, divisions_y, orientation: str = "x+y"):
        # The full SLM array is what is loaded onto the SLM. It is composed of
        # a number of layers of phase arrays, taking values in [0, 2π), which
        # are added holographically, i.e. modulo 2π. These layers are pictured
        # below.
        #
        #     array  grating  global_array
        #                     +---------+
        #     +---+   +---+   |         |
        #     |   | + |   | + |         |
        #     +---+   +---+   |         |
        #                     +---------+
        #
        # The large frames represent the total SLM surface. The smaller frames
        # represent the SLM region of interest. Note that the background region
        # is the difference of a large frame and a small frame.
        array = array + self._get_grating(shape= np.array(array).shape, divisions_x=divisions_x, divisions_y=divisions_y, orientation=orientation)


        if self.correction_pattern is not None:
            
            full_array = np.mod( center_overlay_addition(np.mod(array, 255),self.correction_pattern), 255)

        else:
            full_array = np.mod(array.astype('uint8'), 255)

        return full_array

    @staticmethod
    # @lru_cache
    def _get_grating(shape: tuple[int, int], divisions_x: int, divisions_y:int, orientation: str) -> np.ndarray:
        return phase_to_uint8(linear_grating(shape, divisions_x, divisions_y, orientation))



def phase_to_uint8(phase) -> np.ndarray:
    # XXX The modulo operation adds a large overhead because division is
    # expensive. At some point we should get rid of phases in favor of uint8s,
    # where modulo is taken care by integer overflow.
    phase_principal = phase % TWO_PI
    array = phase_principal * UINT8_PER_RAD
    array = np.round(array).astype('uint8')

    return array



def center_overlay_addition(a: np.ndarray, b: np.ndarray) -> np.ndarray:
    """Overlays array ``a`` centered onto array ``b``.

    Parameters
    ----------
    a : np.ndarray
        The array to be overlaid, should not be larger than `b`.
    b : np.ndarray
        The base array where `a` will be overlaid.

    Returns
    -------
    np.ndarray
        The array ``b`` with ``a`` overlaid at the center.

    Examples
    --------
    >>> a = np.ones((2, 2))
    >>> b = np.zeros((4, 4))
    >>> center_overlay(a, b)
    array([[0, 0, 0, 0],
        [0, 1, 1, 0],
        [0, 1, 1, 0],
        [0, 0, 0, 0]])
    """
    ax, ay = a.shape
    bx, by = b.shape
    if ax > bx or ay > by:
        raise ValueError(f"Cannot overlay: 'a' is larger than 'b'. {a.shape} > {b.shape}")

    x0 = (bx - ax) // 2
    y0 = (by - ay) // 2

    out = b.copy()
    out[x0 : x0 + ax, y0 : y0 + ay] += a
    return out


def linear_grating(
    shape: tuple[int, int],
    divisions_x: int,
    divisions_y:int,
    orientation: t.Literal["x+y", "x-y"] = "x+y",
) -> np.ndarray:

    width, height = shape
    inner_grooves =  100 #100 # does this matte?

    divisions_x = get_grating_divisions(divisions_x,shape[1])
    divisions_y = get_grating_divisions(divisions_y,shape[0])

    # Grating X
    if divisions_x == 0:
        grating_x = np.zeros(shape)

    else:

        canvas = 4*width # 2*width
        x = np.linspace(0,inner_grooves, int(canvas//divisions_x))

        array = np.ceil(x)
        array = array[1:]
        array = np.tile(array,divisions_x)
        array = np.tile(array,(height,1))
        array = array[:height, :width]
        # array = np.flip(array)
        grating_x = normalize(array)

    # Grating Y
    if divisions_y == 0:
        grating_y = np.zeros(shape)

    else:        
        canvas = 4*height # 2*width
        x = np.linspace(0,inner_grooves, int(canvas//divisions_y))
        array = np.ceil(x)
        array = array[1:]
        array = np.tile(array,divisions_y)
        array = np.tile(array,(width,1))
        #Rotate the matrix to create the y direction
        array = array.T
        array = array[:height, :width]
        grating_y = normalize(array)

    # Combination of them
    if orientation == 'x+y':
        final_grating = np.mod(grating_x + grating_y, 1)
    
        return 2*np.pi*final_grating

    else:
        final_grating = np.mod(grating_x - grating_y, 1)
    
        return 2*np.pi*final_grating

def get_grating_divisions(multiplier, size):
    L_max = 1000
    Max_grat = 300
    L = size
    SLM_GRATING_DIVISIONS_max = Max_grat/10*multiplier 
    SLM_GRATING_DIVISIONS = int((L/L_max)*SLM_GRATING_DIVISIONS_max)
    return int(SLM_GRATING_DIVISIONS)



def normalize(array):
    return (array - np.min(array))/(np.max(array) - np.min(array) )

def moded_depth(array,modulation_depth):
    moded_array = np.mod(array,1)*modulation_depth
    return moded_array
