from slm_functions import SlmDisplay
import json
import numpy as np

def initialize_slm(monitor, modulation_depth, correction_pattern_path ):
    """
    Function that initializes the SLM global object for the Python Session we have in Labview,
    Also Initializes another global variable that indicates that SLM is open, and so if we aim 
    to close the slm using the GUI it will close if this variable is true
    """
    global slm
    slm = SlmDisplay(monitor=monitor, modulation_depth=modulation_depth, correction_pattern_file=correction_pattern_path)
    global slm_on_off 
    slm_on_off = True

def update_phase(grating_json, size,phase_array, modulation_depth):
    """
    Function that uploads one phase on the SLM, first using the grating_json we take a value 
    which will be converted to divisions in our other program. Then the size indicates the size
    of the square we will use on the SLM ( small note, currently the MPs number should be the same
    at both axes, I will try to fix it today). The Phase array is the 2D array of squares we modify 
    in the GUI and using the upscale function we make it to the wanted SLM size. Last variable is the
    modulation depth.
    """
    cluster_data = json.loads(grating_json)
    slm._core.modulation_depth = int(modulation_depth)
    slm.divisions_x, slm.divisions_y = int(cluster_data['X']), int(cluster_data['Y'])

    phase_array = np.array(phase_array)
    upscale_factors = [int(size/phase_array.shape[0]),int(size/phase_array.shape[1])]
    upscaled_phase_array = upscale(phase_array, upscale_factors)
    
    
    final_phase = np.flip(slm.load_phase( upscaled_phase_array ),0)
    return final_phase.tolist()

def scan_phase(grating_json, size,index, modulation_depth):
    """
    Function that uploads one phase on the SLM, first using the grating_json we take a value 
    which will be converted to divisions in our other program. Then the shape indicates the shape
    of the square we will use on the SLM. The Phase array is the 2D array of squares we modify 
    in the GUI and using the upscale function we make it to the wanted SLM size. Last variable is the
    modulation depth.
    """
    cluster_data = json.loads(grating_json)
    slm._core.modulation_depth = int(modulation_depth)
    slm.divisions_x, slm.divisions_y = int(cluster_data['X']), int(cluster_data['Y'])

    steps = 50
    phase_array = np.zeros((2,2))
    phases = np.linspace(0,2*np.pi,steps)
    for i in range(steps):

        if index == 0:
            phase_array[0,1] = phases[i]
            phase_array[1,1] = phases[i]

        elif index == 1:
            phase_array[0,0] = phases[i]
            phase_array[0,1] = phases[i]
        else:
            phase_array[0,1] = phases[i]
            phase_array[1,0] = phases[i]

        upscale_factors = [int(size/phase_array.shape[0]),int(size/phase_array.shape[1])]
        upscaled_phase_array = upscale(phase_array, upscale_factors)
        final_phase = np.flip(slm.load_phase( upscaled_phase_array ),0)

    return final_phase.tolist()
        
def close_slm():
    """
    Deletes the object of the
    """
    if slm_on_off:
        del slm
        del slm_on_off



def upscale(array: np.ndarray, factor: int | tuple[int, int]) -> np.ndarray:
    """
    Upscales a 2D numpy array by a specified factor along each axis.

    This function repeats the elements of a 2D numpy array along its rows and
    columns by a specified factor. If the factor is an integer, it scales both
    dimensions by the same factor. If the factor is a tuple of two integers,
    the first integer scales the rows, and the second scales the columns.

    Parameters
    ----------
    array : np.ndarray
        The 2D numpy array to be upscaled.
    factor : int or tuple[int, int]
        The factor or factors by which to upscale `array`. If an integer is
        provided, both dimensions are scaled by this factor. If a tuple of two
        integers is provided, each integer scales a different dimension.

    Examples
    --------
    Upscale a 2D array by a factor of 2:

    >>> arr = np.array([[1, 2], [3, 4]])
    >>> upscale(arr, 2)
    array([[1, 1, 2, 2],
           [1, 1, 2, 2],
           [3, 3, 4, 4],
           [3, 3, 4, 4]])

    Upscale a 2D array by different factors for rows and columns:

    >>> upscale(arr, (2, 3))
    array([[1, 1, 1, 2, 2, 2],
           [1, 1, 1, 2, 2, 2],
           [3, 3, 3, 4, 4, 4],
           [3, 3, 3, 4, 4, 4]])
    """
    if array.ndim != 2:
        raise ValueError("The input array must be a 2D numpy array.")

    if isinstance(factor, int):
        fact1, fact2 = factor, factor
    else:
        fact1, fact2 = factor
    if fact1 < 0 or fact2 < 0:
        raise ValueError("The upscale factor must be non negative.")

    return array.repeat(fact1, axis=0).repeat(fact2, axis=1)

def change_index(array):
    np_array = np.array(array)*2
    np_array = np.flip(np_array,0)
    return np_array.tolist()