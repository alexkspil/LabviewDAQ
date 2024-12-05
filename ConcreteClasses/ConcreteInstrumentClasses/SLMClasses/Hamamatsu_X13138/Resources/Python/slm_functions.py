
import typing as t
# from functools import cached_property, lru_cache
import time
from pathlib import Path

import numpy as np
from PIL import Image
from scipy import special
import time
from  LCOS_SLM_13138_Class import HamaSLM_13138 #Here you import your SLM class


class SlmDisplay:
    """A class for controlling a Spatial Light Modulator (SLM) display.

    This class provides an interface to manage an SLM device, connected as a
    secondary display. It allows for loading different types of patterns onto
    the SLM.

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

    """

    def __init__(
        self,
        monitor: int,
        modulation_depth: int,
        sleep_secs: float = 0.2,
        correction_pattern_file: str | Path | None = None,
    ) -> None:

        self.modulation_depth = modulation_depth
        self._core = HamaSLM_13138(monitor, self.modulation_depth)
        self.sleep_secs = sleep_secs
        self._correction_pattern_file = correction_pattern_file
        self.pixel_pitch = 12.5
        self.width, self.height = self.shape()
        self.background_phase = np.zeros((self.width,self.height))
        self.aperture = np.ones((self.width,self.height))
#         self.divisions_x = 0
#         self.divisions_y = 0

        self.correction_pattern: np.ndarray | None
        if correction_pattern_file is not None:
            global_img = Image.open(correction_pattern_file)
            self.correction_pattern = np.array(global_img, dtype=np.uint8)
            # print(np.max(self.correction_pattern))
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

   
    
    def load_phases(self, phases) -> np.ndarray:
        """Takes a number of phases to load them on the SLM.

        Parameters
        ----------
        *args : np.ndarrays 
            
            
        """
        phases = np.array(phases)
        sum_of_phases = np.sum(phases,0)

        # The array to be displayed on the SLM. All array values must be in
        # [0, 255],that is the result of self.self.phase_to_uint8.
        
        # array = self._make_full_slm_array(sum_of_phases, self.divisions_x, self.divisions_y)
        array = self._make_full_slm_array(sum_of_phases)

        # We need to sleep after updating the SLM because of the rise time of
        # liquid crystals. However, slmPy sleeps before updating so we need to
        # set its sleep time to 0, and have a sleep time AFTER the update.
        self._core.updateArray(array)
        time.sleep(self.sleep_secs)
        # return the uploaded phase in case we want to display it
        return array




    def _make_full_slm_array(self, phases):
#     def _make_full_slm_array(self, array, divisions_x, divisions_y):
        # The full SLM array is what is loaded onto the SLM. It is composed of
        # a number of layers of phase arrays, taking values in [0, 2π), which
        # are added holographically, i.e. modulo 2π. These layers are pictured
        # below.
        #
        #     phases    Background     correction_pattern
        #               +---------+   +---------+
        #     +---+     |         |   |         |
        #     |   | +   |         | + |         |
        #     +---+     |         |   |         |
        #               +---------+   +---------+
        #
        # The large frames represent the total SLM surface. The smaller frames
        # represent the SLM region of interest. Note that the background region
        # is the difference of a large frame and a small frame.
#         array = array + self._get_grating(shape= np.array(array).shape, divisions_x=divisions_x, divisions_y=divisions_y,flip=self.flip)

        if self.correction_pattern is not None:
            # print(phases.shape)
#             full_array = np.mod( self.center_overlay_addition(np.mod(array, 255),self.correction_pattern), 255)
            full_array = self.center_overlay_addition(phases, self.background_phase)
            full_array = np.mod(full_array, 2*np.pi)
            full_array = full_array/np.max(full_array) *255
            full_array = np.round(np.mod( (full_array + self.correction_pattern), self.modulation_depth)).astype('uint8')
            

        else:
            full_array = self.center_overlay_addition(phases, self.background_phase)
            full_array = np.mod(full_array,2*np.pi)
            full_array = np.round(full_array/np.max(full_array) * self.modulation_depth).astype('uint8')
#             full_array = np.mod(array.astype('uint8'), 255)

        return full_array
    

    def center_overlay(self,a: np.ndarray, b: np.ndarray) -> np.ndarray:
        """Overlays array ``a`` centered onto array ``b``.
s
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
            # ax,ay = b.shape
            # bx,by = a.shape
            raise ValueError(f"Cannot overlay: 'a' is larger than 'b'. {a.shape} > {b.shape}")

        x0 = (bx - ax) // 2
        y0 = (by - ay) // 2

        out = b.copy()
        out[x0 : x0 + ax, y0 : y0 + ay] = a
        return out



    def center_overlay_addition(self,a: np.ndarray, b: np.ndarray) -> np.ndarray:
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
            # ax,ay = b.shape
            # bx,by = a.shape
            raise ValueError(f"Cannot overlay: 'a' is larger than 'b'. {a.shape} > {b.shape}")

        x0 = (bx - ax) // 2
        y0 = (by - ay) // 2

        out = b.copy()
        out[x0 : x0 + ax, y0 : y0 + ay] = out[x0 : x0 + ax, y0 : y0 + ay] + a
        return out
