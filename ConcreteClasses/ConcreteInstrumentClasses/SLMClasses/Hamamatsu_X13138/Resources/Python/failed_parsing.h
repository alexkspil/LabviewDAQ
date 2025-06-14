
                // Standard types
                typedef unsigned char uint8_t;
                typedef short int16_t;
                typedef int int32_t;
                typedef unsigned int uint32_t;
                typedef double double_t;
                
                // LabVIEW-compatible types
                typedef int32_t Bool32;
                typedef int32_t LVBoolean;
                typedef int32_t MgErr;
                
                // Required SLM functions
                int32_t Open_Dev(uint8_t* bID, int32_t size);
                int32_t Close_Dev(uint8_t* bID, int32_t size);
                int32_t Write_FMemArray(uint8_t bID, uint8_t* data, 
                                    int32_t size, uint32_t x, uint32_t y, 
                                    uint32_t slot);
                int32_t Check_Temp(uint8_t bID, double* headTemp, double* cbTemp);
            
/*!
 * Open_Dev
 */
int32_t __stdcall Open_Dev(uint8_t bIDList[], int32_t bIDSize);
/*!
 * Close_Dev
 */
int32_t __stdcall Close_Dev(uint8_t bIDList[], int32_t bIDSize);
/*!
 * Check_HeadSerial
 */
int32_t __stdcall Check_HeadSerial(uint8_t bID, char HeadSerial[], 
	int32_t CharSize);
/*!
 * Write_FMemArray
 */
int32_t __stdcall Write_FMemArray(uint8_t bID, uint8_t ArrayIn[], 
	int32_t ArraySize, uint32_t XPixel, uint32_t YPixel, uint32_t SlotNo);
/*!
 * Write_FMemBMPPath
 */
int32_t __stdcall Write_FMemBMPPath(uint8_t bID, char Path[], 
	uint32_t SlotNo);
/*!
 * Change_DispSlot
 */
int32_t __stdcall Change_DispSlot(uint8_t bID, uint32_t SlotNo);
/*!
 * Check_Temp
 */
int32_t __stdcall Check_Temp(uint8_t bID, double *HeadTemp, double *CBTemp);
/*!
 * Check_FMem_Slot
 */
int32_t __stdcall Check_FMem_Slot(uint8_t bID, uint32_t ArraySize, 
	uint32_t XPixel, uint32_t YPixel, uint32_t SlotNo, uint8_t ReadArray[]);
/*!
 * Mode_Select
 */
int32_t __stdcall Mode_Select(uint8_t bID, uint8_t Mode);
/*!
 * Check_Disp_IMG
 */
int32_t __stdcall Check_Disp_IMG(uint8_t bID, uint32_t ArraySize, 
	uint32_t XPixel, uint32_t YPixel, uint8_t ReadArray[]);
/*!
 * Check_LED
 */
int32_t __stdcall Check_LED(uint8_t bID, uint32_t *LED_Status);
/*!
 * Mode_Check
 */
int32_t __stdcall Mode_Check(uint8_t bID, uint32_t *Mode);
/*!
 * Check_IO
 */
int32_t __stdcall Check_IO(uint8_t bID, uint32_t *IO_Status);
/*!
 * Reboot
 */
void __stdcall Reboot(uint8_t bID);
/*!
 * Write_SDBMPPath
 */
int32_t __stdcall Write_SDBMPPath(uint8_t bID, char Path[], 
	uint32_t SDSlotNo);
/*!
 * Write_SDArray
 */
int32_t __stdcall Write_SDArray(uint8_t bID, uint8_t ArrayIn[], 
	int32_t ArraySize, uint32_t XPixel, uint32_t YPixel, uint32_t SDSlotNo);
/*!
 * Check_SD_Slot
 */
int32_t __stdcall Check_SD_Slot(uint8_t bID, uint32_t ArraySize, 
	uint32_t XPixel, uint32_t YPixel, uint32_t SDSlotNo, uint8_t ReadArray[]);
/*!
 * Upload_from_SD_to_FMem
 */
int32_t __stdcall Upload_from_SD_to_FMem(uint8_t bID, uint32_t SDSlotNo, 
	uint32_t FMemSlotNo);



} // extern "C"

