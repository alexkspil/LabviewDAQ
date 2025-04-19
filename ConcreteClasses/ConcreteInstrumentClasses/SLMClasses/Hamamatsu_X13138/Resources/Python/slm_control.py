from slm_functions import SlmDisplay
from Phases import *
import json
import numpy as np


orientations = {0:1, 1:-1}
def initialize_slm(monitor, modulation_depth, correction_pattern_path):
    global slm
    slm = SlmDisplay(monitor=monitor, modulation_depth=modulation_depth, correction_pattern_file=correction_pattern_path)
    global slm_on_off 
    slm_on_off = True
    phase_on = slm.correction_pattern.copy()
    # phase_on = np.flip(phase_on,0)
    return phase_on.tolist()

def get_SLM_size():
    return [slm.height, slm.width]

def update_phase(phases):
    final_phase = slm.load_phases( phases )
    # final_phase = slm.load_phase( phase_array )
    return final_phase.tolist()


def update_grating_partial(grating1_json, grating2_json):
    # Parse JSON inputs
    g1 = json.loads(grating1_json)
    g2 = json.loads(grating2_json)
    

    def place_grating(slm_screen, grating, center, size):
        """Place a grating on the SLM screen at specified center position"""
        cx, cy = center
        width, height = size
        grating_height, grating_width = grating.shape
        
        # Calculate bounds
        x_start = max(0, cx - width//2)
        x_end = min(1280, cx + width//2)
        y_start = max(0, cy - height//2)
        y_end = min(1024, cy + height//2)
        
        # Calculate corresponding grating portion
        gx_start = max(0, -cx + width//2)
        gx_end = grating_width - max(0, cx + width//2 - 1280)
        gy_start = max(0, -cy + height//2)
        gy_end = grating_height - max(0, cy + height//2 - 1024)
        
        # Place the grating
        slm_screen[y_start:y_end, x_start:x_end] = grating[gy_start:gy_end, gx_start:gx_end]

    # Create blank SLM screen
    slm_screen = np.zeros((1024, 1280))
    
    # Generate grating 1
    grating1 = partial_grating(
        size = (int(g1['X Size']), int(g1['Y Size'])),
        angles=(int(g1['X Angle']), int(g1['Y Angle'])),
        flip=int(g1['Flip']),
        orientation=orientations[int(g1['Orientation'])],
        slm_size = (1280,1024)
    )

    place_grating(slm_screen, grating1, 
                 (int(g1['X Center']), int(g1['Y Center'])),
                 (int(g1['X Size']), int(g1['Y Size'])))
    
    grating2 = partial_grating(
        size=(int(g2['X Size']), int(g2['Y Size'])),
        angles = (int(g2['X Angle']), int(g2['Y Angle'])),
        flip=int(g2['Flip']),
        orientation=orientations[int(g2['Orientation'])],
        slm_size =  (1280,1024)
    )
    
    place_grating(slm_screen, grating2,
                 (int(g2['X Center']), int(g2['Y Center'])),
                 (int(g2['X Size']), int(g2['Y Size'])))
    
    return slm_screen.tolist()

def update_grating(grating_json, height, width):
    grating_data = json.loads(grating_json)
    grating_phase = grating((width,height),int(grating_data['X']), int(grating_data['Y']), int(grating_data['Flip']),  orientations[int(grating_data['Orientation'])])
    grating_phase = np.flip(grating_phase,0)
    return grating_phase.tolist()


def update_fresnel(fresnel_json, height, width):
    fresnel_data = json.loads(fresnel_json)
    fresnel_phase = fresnel_lens((width,height),fresnel_data['Focal Length'], fresnel_data['Wavelength'], fresnel_data['x_0'], fresnel_data['y_0'])
    return fresnel_phase.tolist()



def update_LG(LG_json, height, width):
    LG_data = json.loads(LG_json)
    LG_phase = Laguerre_Gaussian((width,height),LG_data['L'],LG_data['P'],LG_data['w_0'],LG_data['x_0'],LG_data['y_0'])
    return LG_phase.tolist()


def update_HG(HG_json, height, width):
    HG_data = json.loads(HG_json)
    HG_phase = Hermite_Gaussian((width,height),HG_data['n'],HG_data['m'],HG_data['w_0'],HG_data['x_0'],HG_data['y_0'])
    return HG_phase.tolist()


def update_Axicon(Axicon_json, height, width):
    axicon_data = json.loads(Axicon_json)
    axicon_phase = axicon((width,height),axicon_data['r_0'], axicon_data['x_0'], axicon_data['y_0'])
    return axicon_phase.tolist()


def update_Airy(airy_json, height, width):
    airy_data = json.loads(airy_json)
    airy_phase = airy_beam((width,height),airy_data['Power'], airy_data['Denominator'])
    return airy_phase.tolist()


def update_Bessel(bessel_json, height, width):
    bessel_data = json.loads(bessel_json)
    bessel_phase = bessel_beam((width,height),bessel_data['Wavelength'], bessel_data['Refractive Index'],bessel_data['Topological Charge'], bessel_data['Degree'])
    return bessel_phase.tolist()


def update_superpixel_array(array, height, width):
    superpixel_array = np.array(array)*np.pi
    upscale_factors = [int(height/superpixel_array.shape[0]),int(width/superpixel_array.shape[1])]
    upscaled_superpixel_array = upscale(superpixel_array, upscale_factors)
    # upscaled_superpixel_array = np.flip(np.flip(upscaled_superpixel_array,0),1)
    return upscaled_superpixel_array.tolist()


def update_superpixel_checkerboard(checkerboard_json, height, width):
    checkerboard_data = json.loads(checkerboard_json)

    
    superpixel_checkerboard_array = make_checkerboard((checkerboard_data['Super Pixel X'], checkerboard_data['Super Pixel Y']), checkerboard_data['Multiplier A'], checkerboard_data['Multiplier B'])    
    upscale_factors = [int(height/superpixel_checkerboard_array.shape[0]),int(width/superpixel_checkerboard_array.shape[1])]
    upscaled_superpixel_checkerboard_array = upscale(superpixel_checkerboard_array, upscale_factors)*np.pi

    return upscaled_superpixel_checkerboard_array.tolist()


def update_vortex(vortex_array, height, width):
    vortex_array = np.array(vortex_array)
    final_vortex_phase = np.zeros((width,height))
    vortex_shape = [int(height/vortex_array.shape[0]),int(width/vortex_array.shape[1])]
    vortex_phase = vortex_not_mod((vortex_shape))
    
    for i in range(vortex_array.shape[0]):
        for j in range(vortex_array.shape[1]):
            final_vortex_phase[j*vortex_shape[1]:j*vortex_shape[1]+vortex_shape[1],i*vortex_shape[0]:i*vortex_shape[0]+vortex_shape[0]]  = \
                np.mod(vortex_array[i,j]*vortex_phase, 2*np.pi)
            
    final_vortex_phase = np.swapaxes(final_vortex_phase,0,1)
    return final_vortex_phase.tolist()


def update_vortex_checkerboard(vortex_json, height, width):
    vortex_data = json.loads(vortex_json)
    
    vortex_checkerboard_array = make_checkerboard((vortex_data['VortexPixel X'], vortex_data['VortexPixel Y']), vortex_data['Topological Charge A'], vortex_data['Topological Charge B'])
    final_vortex_phase = np.zeros((width,height))
    vortex_shape = [int(height/vortex_checkerboard_array.shape[0]),int(width/vortex_checkerboard_array.shape[1])]
    vortex_phase = vortex_not_mod((vortex_shape))
    
    for i in range(vortex_data['VortexPixel X']):
        for j in range(vortex_data['VortexPixel Y']):
            final_vortex_phase[j*vortex_shape[1]:j*vortex_shape[1]+vortex_shape[1],i*vortex_shape[0]:i*vortex_shape[0]+vortex_shape[0]]  = \
                np.mod(vortex_checkerboard_array[i,j]*vortex_phase, 2*np.pi)
    final_vortex_phase = np.swapaxes(final_vortex_phase,0,1)
    return final_vortex_phase.tolist()

def update_aperture(aperture_array, height, width):
    aperture_array = np.array(aperture_array)
    final_aperture_mask = np.zeros((width,height))
    aperture_shape = [int(height/aperture_array.shape[0]),int(width/aperture_array.shape[1])]
    
    for i in range(aperture_array.shape[0]):
        for j in range(aperture_array.shape[1]):
            final_aperture_mask[j*aperture_shape[1]:j*aperture_shape[1]+aperture_shape[1],i*aperture_shape[0]:i*aperture_shape[0]+aperture_shape[0]]  = \
                circular_aperture((aperture_shape),aperture_array[i,j])
            
    final_aperture_mask = np.swapaxes(final_aperture_mask,0,1)

    return final_aperture_mask.tolist()

def update_aperture_checkerboard(aperture_json, height, width):
    aperture_data = json.loads(aperture_json)
    
    aperture_checkerboard_array = make_checkerboard((aperture_data['Pixel X'], aperture_data['Pixel Y']), aperture_data['Multiplier A'], aperture_data['Multiplier B'])
    final_aperture_mask = np.zeros((width,height))
    aperture_shape = [int(height/aperture_checkerboard_array.shape[0]),int(width/aperture_checkerboard_array.shape[1])]
    
    for i in range(aperture_data['Pixel X']):
        for j in range(aperture_data['Pixel Y']):
            final_aperture_mask[j*aperture_shape[1]:j*aperture_shape[1]+aperture_shape[1],i*aperture_shape[0]:i*aperture_shape[0]+aperture_shape[0]]  = \
                circular_aperture((aperture_shape),aperture_checkerboard_array[i,j])
            
    final_aperture_mask = np.swapaxes(final_aperture_mask,0,1)

    return final_aperture_mask.tolist()

def update_modulation_depth(modulation_depth):
    slm._core.modulation_depth = modulation_depth

def update_background(background_phases, mask_aperture):
    background_phases = np.array(background_phases)
    background = np.sum(background_phases,0)
    inverse_mask = inverse_circular_aperture(mask_aperture)
    final_mask = np.ones(background.shape)
    final_mask = center_overlay(inverse_mask,final_mask)
    slm.background_phase = final_mask*background.copy()
    return background

        
        
def close_slm():
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


def center_overlay(a: np.ndarray, b: np.ndarray) -> np.ndarray:
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
    out[x0 : x0 + ax, y0 : y0 + ay] = a
    return out

