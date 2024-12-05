import numpy as np
from scipy import special




class Phases():
    def __init__(self, width, height, pixel_pitch, modulation_depth, lambda_nm):
        self.width = width
        self.height = height 
        self.pixel_pitch = pixel_pitch*(10**(-6))
        self.modulation_depth = modulation_depth
        self.lambda_nm = lambda_nm
        
    def grating(self,nx,ny):
        x = np.arange(- self.width / 2, self.width / 2 - 1, 1)
        y = np.arange(-self.height / 2, self.height / 2 - 1, 1)
        X, Y = np.meshgrid(x, y)  
        
        gx = nx / H  
        gy = ny / V  
        
        grating = np.mod( 2 * np.pi * (gy * Y + gx * X), 2 * np.pi)
        
        return grating

 
    def fresnel_lens(self,f,x_0=0,y_0=0):

        x = np.linspace(-self.width/2 ,self.width/2.0,self.width)
        y = np.linspace(-self.height/2 ,self.height/2,self.height)
        x = x*8e-3  # Scale to mm
        y = x*8e-3  # Scale to mm
        X,Y = np.meshgrid(x, y) # grid of point

        lambda_mm = lambda_nm * 1e-6  # Convert nm to mm
        f = f*mm

        k = 2*np.pi/lambda_mm
        rho = np.sqrt((X-x0)**2 + (Y-y0)**2)
        
        # focal length in mm
        f0cal_length = f
        
        # Transmitance Function of Lens
        T = np.pi/lambda_mm/ff*rho**2
        
        fresnel = np.mod(T, 2*np.pi)
        fresnel = fresnel - np.min(fresnel)

        return fresnel
    
    def vortex(self,l)
        x = np.arange(- self.width / 2, self.width / 2 - 1, 1)
        y = np.arange(-self.height / 2, self.height / 2 - 1, 1)
        X, Y = np.meshgrid(x, y) 
        
        phase = np.angle(X+1j*Y)
        vortex = np.mod(l * phi, 2 * np.pi)
        
        return vortex
    
    def bessel_beam(self, ni, l, degree):
        x = np.arange(- self.width / 2, self.width / 2 - 1, 1)
        y = np.arange(-self.height / 2, self.height / 2 - 1, 1)
        x = x** 8e-3  # Scale to mm
        y = y** 8e-3  # Scale to mm
        X, Y = np.meshgrid(x, y) 
                    
        rho = np.sqrt(X**2 + Y**2)
        phi = np.angle(X + 1j * Y)
        lambda_mm = lambda_nm * 1e-6  # Convert nm to mm
                    
        k = 2 * np.pi / lambda_mm  # Wavenumber in mm^-1
        gama = degree*np.pi/180
        kr = k * (ni - 1) * gama  # Axicon radial component
                    
        bessel = np.mod(-l * phi + kr * rho, 2 * np.pi)
        return bessel
                    
    def airy_beam(self,power,denominator):
        x = np.arange(- self.width / 2, self.width / 2 - 1, 1)
        y = np.arange(-self.height / 2, self.height / 2 - 1, 1)
        x = x** 8e-3  # Scale to mm
        y = y** 8e-3  # Scale to mm
        X, Y = np.meshgrid(x, y) 
        
        A = (X**power + Y**power)/denominator
        airy = np.mod(A, 2 * np.pi)
        return airy
    
    def axicon(self,r_0,x_0=0,y_0=0):
        x = np.arange(-self.width/2,self.width/2,1)
        y = np.arange(-self.height/2,self.height/2,1)
        X,Y = np.meshgrid(x, y) # grid of point
        
        r = (np.sqrt((X-x_0)**2 +(Y-y_0)**2))
        g = np.exp(1j*((2*np.pi)*(r/r_0)))
        
        phase = (np.mod(np.angle(g),2*np.pi))
        axicon = self.normalize(phase)
                    

        return axicon

 
     ## https://iopscience.iop.org/article/10.1088/2040-8986/ab31c3/meta##
    def Laguerre_Gaussian(self,l,p,w_0,N = 1,x_0 = 0,y_0 =0): 

        x = np.arange(-self.width/2,self.width/2,1)
        y = np.arange(-self.height/2,self.height/2,1)
        X,Y = np.meshgrid(x, y)
   
        r = np.sqrt((X-x_0)**2 + (Y-y_0)**2)
        theta = np.arctan2((Y-y_0),(X-x_0))
        L = special.genlaguerre(p,l,True)
        u = (((np.sqrt(2)*r)/w_0)**(l))*(np.exp(-1*(r**2)/(w_0)**2))*L(2*(r/w_0)**2)*np.exp(-1j*l*theta)
        phase =np.mod( np.angle(u),N*2*np.pi)
        laguerre = self.normalize(phase)
  
        return  laguerre
    

