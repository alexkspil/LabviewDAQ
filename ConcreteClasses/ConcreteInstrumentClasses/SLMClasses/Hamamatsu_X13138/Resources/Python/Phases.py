import numpy as np
from scipy import special
import math

def partial_grating(size, angles, flip=0, orientation=1, slm_size=(1280, 1024)):
    """Create a properly oriented grating pattern with both X and Y modulation"""
    width, height = size
    nx, ny = angles
    print(angles)
    slm_width, slm_height = slm_size
    
    # Create coordinate arrays (relative to grating center)
    x = np.arange(-width//2, width//2)
    y = np.arange(-height//2, height//2)
    X, Y = np.meshgrid(x, y)
    
    # Calculate spatial periods (how many pixels per full cycle)
    period_x = slm_width / nx if nx != 0 else float('inf')
    period_y = slm_height / ny if ny != 0 else float('inf')
    
    # Convert to wave numbers (radians/pixel)
    kx = (2 * np.pi) / period_x if period_x != float('inf') else 0
    ky = (2 * np.pi) / period_y if period_y != float('inf') else 0
    
    # Create phase pattern with proper orientation
    phase = np.mod(kx * X + orientation * ky * Y, 2 * np.pi)
    
    if flip:
        phase =  np.flip(np.flip(phase,0),1)
    
    return phase

def grating(shape, nx, ny,flip=0, orientation=1):
    width, height = shape
    x = np.arange(-width // 2, width // 2 , 1)
    y = np.arange(-height // 2, height // 2 , 1)
    X, Y = np.meshgrid(x, y)  

    gx = nx / width 
    gy = ny / height 

    grating_phase = np.mod( 2 * np.pi * (orientation*gy * Y + gx * X), 2 * np.pi)
    if flip:
        grating_phase = np.flip(np.flip(grating_phase,0),1)
    
    return grating_phase



def fresnel_lens(shape, focal_length, lambda_nm, x0=0, y0=0):
    
    width, height = shape
    x = np.arange(- width / 2, width / 2 , 1)
    y = np.arange(-height / 2, height / 2 , 1)
    x = x*8e-3  # Scale to mm
    y = y*8e-3  # Scale to mm
    X,Y = np.meshgrid(x, y) # grid of point

    lambda_mm = lambda_nm*(10**(-6))
    k = 2*np.pi/lambda_mm
    rho = np.sqrt((X-x0)**2 + (Y-y0)**2)

    # Transmitance Function of Lens
    T = np.pi/lambda_mm/focal_length*rho**2

    fresnel = np.mod(T, 2*np.pi)
    fresnel = fresnel - np.min(fresnel)

    return fresnel



def vortex(shape, l):
    width, height = shape
    x = np.arange(- width / 2, width / 2 , 1)
    y = np.arange(-height / 2, height / 2 , 1)
    X, Y = np.meshgrid(x, y) 

    phase = np.angle(X+1j*Y)
    vortex = np.mod(l * phase, 2 * np.pi)

    return vortex


def vortex_not_mod(shape):
    width, height = shape
    x = np.arange(- width / 2, width / 2 , 1)
    y = np.arange(-height / 2, height / 2 , 1)
    X, Y = np.meshgrid(x, y) 

    phase = np.angle(X+1j*Y)
    return phase


def bessel_beam(shape, lambda_nm, ni, l, degree):
    
    width, height = shape
    x = np.arange(- width / 2, width / 2 , 1)
    y = np.arange(-height / 2, height / 2 , 1)
    x = x*8e-3  # Scale to mm
    y = y*8e-3  # Scale to mm
    X, Y = np.meshgrid(x, y) 

    rho = np.sqrt(X**2 + Y**2)
    phi = np.angle(X + 1j * Y)
    lambda_mm = lambda_nm * 1e-6  # Convert nm to mm

    k = 2 * np.pi / lambda_mm  # Wavenumber in mm^-1
    gama = degree*np.pi/180
    kr = k * (ni - 1) * gama  # Axicon radial component

    bessel = np.mod(-l * phi + kr * rho, 2 * np.pi)
    return bessel



def airy_beam(shape, power, denominator):
    width, height = shape
    x = np.arange(- width / 2, width / 2, 1)
    y = np.arange(-height / 2, height / 2, 1)
    x = x*8e-3  # Scale to mm
    y = y*8e-3  # Scale to mm
    X, Y = np.meshgrid(x, y) 

    A = (X**power + Y**power)/denominator
    airy = np.mod(A, 2 * np.pi)
    return airy



def axicon(shape, r_0=100, x_0=0, y_0=0):
    width, height = shape
    x = np.arange(- width / 2, width / 2, 1)
    y = np.arange(-height / 2, height / 2, 1)
    X,Y = np.meshgrid(x, y) # grid of point

    r = (np.sqrt((X-x_0)**2 +(Y-y_0)**2))
    g = np.exp(1j*((2*np.pi)*(r/r_0)))

    phase = (np.mod(np.angle(g),2*np.pi))

    return phase


#  ## https://iopscience.iop.org/article/10.1088/2040-8986/ab31c3/meta##
def Laguerre_Gaussian(shape,l,p,w_0,x_0 = 0,y_0 =0): 

    width, height = shape
    x = np.arange(- width / 2, width / 2 , 1)
    y = np.arange(-height / 2, height / 2 , 1)
    X,Y = np.meshgrid(x, y)

    r = np.sqrt((X-x_0)**2 + (Y-y_0)**2)
    theta = np.arctan2((Y-y_0),(X-x_0))
    L = special.genlaguerre(p,l,True)
    u = (((np.sqrt(2)*r)/w_0)**(l))*(np.exp(-1*(r**2)/(w_0)**2))*L(2*(r/w_0)**2)*np.exp(-1j*l*theta)
    phase =np.mod( np.angle(u),2*np.pi)
    # laguerre = phase/np.max(phase)

    # return  laguerre
    return  phase

            

def Hermite_Gaussian(shape, n, m, w_0, x_0=0, y_0=0):
    width, height = shape

    x=np.arange( -width/2, width/2,1)
    y= np.arange( -height/2, height/2,1)
    X,Y=np.meshgrid(x,y)
    r= np.sqrt((X-x_0)**2 +(Y-y_0)**2)

    Hx = np.polyval(special.hermite(n), np.sqrt(2)*X/w_0)
    Hy = np.polyval(special.hermite(m), np.sqrt(2)*Y/w_0)
    u = (1/w_0)*np.sqrt((2**(-(n+m-1)))/(math.factorial(n)*math.factorial(m)*np.pi))*Hx*Hy*np.exp(-(r*2)/w_0)

    HG_phase = np.mod(np.angle(u),2*np.pi)

    return HG_phase
                            
                            
def make_checkerboard(shape, a=0, b=1):
    # create a height * width matrix
    x = np.ones(shape, dtype=int)*a

    x[1::2, ::2] = b
    x[::2, 1::2] = b

    return x

def circular_aperture(shape, circular_aperture_radius):

    width, height = shape
    x = np.arange(- width / 2, width / 2 , 1)
    y = np.arange(-height / 2, height / 2 , 1)
    X,Y = np.meshgrid(x, y)
    rho = np.sqrt(X**2 + Y**2)

    circular_aperture =  np.abs(rho) <= circular_aperture_radius

    return circular_aperture

def inverse_circular_aperture(circular_aperture):


    inverse_circular_aperture =  np.abs(circular_aperture) < 1

    return inverse_circular_aperture



