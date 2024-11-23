# from cffi import FFI
# from PIL import Image
# import numpy as np
from ctypes import *
import matplotlib.pyplot as plt
import os


class HamaSLM_13138:
    def __init__(self, monitor, modulation_depth) -> None:
        #pixelpitch(0: 20um 1: 1.25um)
        self.pitch = 1
        #LCOS pixel size
        self.x = 1272
        self.y = 1024
        #LCOS-SML monitor number setting
        self.monitorNo = monitor # 2
        self.windowNo = 0
        self.xShift = 0
        self.yShift = 0
        #pixel number
        self.array_size = self.x * self.y
        self.modulation_depth = modulation_depth #for 810 --> 214 #256
        os.chdir(os.curdir)
        # make the 8bit unsigned integer array type
        self.FARRAY = c_uint8 * self.array_size
        self.farray = self.FARRAY(0)
        dll_dir = os.getcwd() + '\Image_Control.dll'
        self.Lcoslib = windll.LoadLibrary(r'C:\Users\quantum\Documents\LVDAQ\ConcreteClasses\ConcreteInstrumentClasses\SLMClasses\Hamamatsu_X13138\Resources\Python\Image_Control.dll')
        #Select LCOS window
        Window_Settings = self.Lcoslib.Window_Settings
        Window_Settings.argtypes = [c_int, c_int, c_int, c_int]
        Window_Settings.restype = c_int
        Window_Settings(self.monitorNo, self.windowNo, self.xShift, self.yShift)
    '''
    the function for showing on LCOS display
    int monitorNo: 
    int windowNo:
    int x: Pixel number of x-dimension
    int xShift: shift pixels of x-dimension
    int y: Pixel number of y-dimension
    int yShift: shift pixels of y-dimension
    8bit unsigned int array array: output array
    '''
    def updateArray(self, array):
        n = array.shape[0]
        k = array.shape[1]
        array = array % self.modulation_depth


        outputPattern = array
        # perhaps this one should be defined as integer:
        # outputPattern = np.asarray(array, dtype=int)
        max_l = []

        for i in range(n):
            for j in range(k):
                self.farray[i*k + j] = c_uint8(int(outputPattern[i][j] % self.modulation_depth))

        
        # Show pattern
        Window_Array_to_Display = self.Lcoslib.Window_Array_to_Display
        Window_Array_to_Display.argtypes = [c_void_p, c_int, c_int, c_int, c_int]
        Window_Array_to_Display.restype = c_int
        Window_Array_to_Display(self.farray, self.x, self.y, self.windowNo, self.array_size)
        
 

        # print('Phase Uploaded')

        return 0
    
    def getSize(self):
        return self.x, self.y


        