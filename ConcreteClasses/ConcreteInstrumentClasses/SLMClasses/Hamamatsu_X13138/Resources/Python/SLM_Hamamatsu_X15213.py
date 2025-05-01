# import numpy as np
import os
from cffi import FFI
import time
from slm_base import SLM

# Communicate with hamamatsu slm
class HamaSLM_15213(SLM):
    def __init__(self):
       # super(SlmDisplay, self).__init__()
        """ slm init variables"""
        
        self.current_path = os.getcwd()  # + r"\slm"
        SLM_DLL_FOLDER = self.current_path + r"\hpkSLMdaLV_stdcall_64bit"
        os.environ['PATH'] = SLM_DLL_FOLDER + os.pathsep + os.environ.get('PATH', '')
        os.add_dll_directory(self.current_path + r"\hpkSLMdaLV_stdcall_64bit")

            


        self.ffi = FFI()
        self.cdef_from_file = None
        self.header = None
        self.slmffi = None
        self.bID = []
        self.bIDmem = []
        #SLM Size
        self.x = 1000
        self.y = 2000


    

    def connect(self) -> int:
        """Opens communication with the slm

        Returns
        -------
        int
        - sets upon self writes bID to the class variables and returns it as a string
        """
        self.header = self.current_path + r"\hpkSLMdaLV_stdcall_64bit\hpkSLMdaLVt.h"
        self.slmffi = self.ffi.dlopen(self.current_path + r"\hpkSLMdaLV_stdcall_64bit\hpkSLMdaLV.dll")
        try:
            with open(self.header) as slm_header:
                self.cdef_from_file = slm_header.read()

        except FileNotFoundError:
            print("header not found")
        except IOError:
            print("could not open header")
        finally:
            if self.cdef_from_file == '':
                print('empty header')

        self.ffi.cdef(self.cdef_from_file, override=True)
        bIDList = self.ffi.new('uint8_t[10]')
        try:
            self.slmffi.Open_Dev(bIDList, 10)
            print('SLM init: com ok')
        except:
            print('slm init: no communication')
        self.bID = bIDList[0]
        self.bIDmem = bIDList
        return self.bID

    def close_slm(self) -> bool:
        """Closes Connection with SLM

        Returns
        -------
        Boolean
        True if itt closes or False if it failed 
        """
        try:
            self.slmffi.Close_Dev(self.bIDmem, 10)
            self.ffi.dlclose(self.slmffi)
            closed = True
            print('close SLM: ok')
        except ValueError:
            closed = True
            print('SLM already closed')
                
        except:
            print('close com with slm failed')
            closed = False


        return closed
    

    def check_temp(self) :
        """Check the temperature of the SLM

        Returns
        -------
        Dictionary
        - Current Temperature 
        """

        self.bID = self.ffi.cast('uint8_t', self.bID)
        HeadTemp = self.ffi.new('double *')
        CBTemp = self.ffi.new('double *')
        self.slmffi.Check_Temp(self.bID, HeadTemp, CBTemp)
        result = {'Head_Temperature': HeadTemp[0],'Driver_Temperature': CBTemp[0] }
        return result


    def upload_phase(self, image) -> None:
        """uploads uint8 phase to the SLM Display

        Returns
        -------
        None
        """
        image = image.astype('uint8')
        ArraySize = self.ffi.new('int32_t*')
        ArraySize = self.ffi.cast('int32_t', image.shape[1] * image.shape[0])
        XPixel = self.ffi.new('uint32_t*')
        XPixel = self.ffi.cast('uint32_t', image.shape[1])
        YPixel = self.ffi.new('uint32_t*')
        YPixel = self.ffi.cast('uint32_t', image.shape[0])
        SlotNo = self.ffi.new('uint32_t*')
        SlotNo = self.ffi.cast('uint32_t', 0)
        ArrayIn = self.ffi.new('uint8_t [{}]'.format(image.shape[1] * image.shape[0]))
        
        
#         image = image.flatten().astype('uint8')  # Flatten and ensure uint8 type
#         ArrayIn = self.ffi.new('uint8_t[{}]'.format(image.size), image.tolist())
        image = image.flatten()
        for i, el in enumerate(ArrayIn):
            ArrayIn[i] = self.ffi.cast('uint8_t', image[i])
        bID = self.ffi.cast('uint8_t', self.bID)
        
        """upload, the func itself"""
        self.slmffi.Write_FMemArray(bID, ArrayIn, ArraySize, XPixel, YPixel, SlotNo)
        
#         result = self.slmffi.Write_FMemArray(bID, ArrayIn, ArraySize, XPixel, YPixel, SlotNo)
#         if result != 0:  # Assuming non-zero indicates an error
#             raise RuntimeError("Failed to upload phase pattern to SLM.")
        
        time.sleep(0.1)  
        # print("uploaded")
        
    def get_Size(self):
        """Returns the Size of the SLM Display.

        Returns
        -------
        tuple
            (x_size, y_size) of SLM screen.
        """
        return self.x, self.y
        
    def __del__(self):
        """Deletes the object and closes the SLM connection."""
        try:
            self.close_slm()
        except Exception as e:
            print(f"Error during cleanup: {e}")
        print("SLM object destroyed.")
