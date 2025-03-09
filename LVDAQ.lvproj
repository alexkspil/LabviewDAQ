<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="23008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="NI.SortType" Type="Int">3</Property>
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="Translation Stage Library" Type="Folder">
			<Item Name="ArduinoTranslationStage.lvlib" Type="Library" URL="../ConcreteClasses/ConcreteInstrumentClasses/Arduino_Stepper/ArduinoTranslationStage.lvlib"/>
			<Item Name="TranslationStage_UI.lvlib" Type="Library" URL="../UIs/TranslationStage_UI/TranslationStage_UI.lvlib"/>
			<Item Name="BPC30x.lvlib" Type="Library" URL="../ConcreteClasses/ConcreteInstrumentClasses/BPC301/BPC30x.lvlib"/>
			<Item Name="Jiaxin_Stepper_Controller.lvlib" Type="Library" URL="../ConcreteClasses/ConcreteInstrumentClasses/Jiaxin_Stepper_Controller/Jiaxin_Stepper_Controller.lvlib"/>
			<Item Name="KIM101.lvlib" Type="Library" URL="../ConcreteClasses/ConcreteInstrumentClasses/KIM101/KIM101.lvlib"/>
			<Item Name="MB Master.lvlib" Type="Library" URL="/&lt;vilib&gt;/Plasmionique/MB Master/MB Master.lvlib"/>
			<Item Name="TranslationStagesInterface.lvlib" Type="Library" URL="../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStagesInterface.lvlib"/>
		</Item>
		<Item Name="Spectrometer Library" Type="Folder">
			<Item Name="HRS_Spectrometer.lvlib" Type="Library" URL="../ConcreteClasses/ConcreteInstrumentClasses/SpectrometerClasses/Spectrometer_HRS_LV/HRS_Spectrometer/HRS_Spectrometer.lvlib"/>
			<Item Name="SpectrometerComm.lvlib" Type="Library" URL="../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm.lvlib"/>
			<Item Name="SpectrometerInterface.lvlib" Type="Library" URL="../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerInterface.lvlib"/>
			<Item Name="SpectrometerUI.lvlib" Type="Library" URL="../UIs/SpectrometerUI/SpectrometerUI.lvlib"/>
		</Item>
		<Item Name="Camera Library" Type="Folder">
			<Item Name="Camera_Controller.lvlib" Type="Library" URL="../UIs/Camera_Controller/Camera_Controller.lvlib"/>
			<Item Name="Camera_Controller_Comm.lvlib" Type="Library" URL="../UIs/Camera_Controller/Camera_Controller_Comm/Camera_Controller_Comm.lvlib"/>
			<Item Name="CameraComm.lvlib" Type="Library" URL="../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraComm.lvlib"/>
			<Item Name="CameraInterface Messages.lvlib" Type="Library" URL="../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface Messages/CameraInterface Messages.lvlib"/>
			<Item Name="CameraInterface.lvlib" Type="Library" URL="../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface/CameraInterface.lvlib"/>
			<Item Name="Hamamatsu_Camera.lvlib" Type="Library" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/Hamamatsu_Camera.lvlib"/>
			<Item Name="Inovance_Camera.lvlib" Type="Library" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Inovance_LV/Inovance_Camera/Inovance_Camera.lvlib"/>
		</Item>
		<Item Name="Single Photon Library" Type="Folder">
			<Item Name="Multiharp.lvlib" Type="Library" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Multiharp.lvlib"/>
			<Item Name="MultiharpComm.lvlib" Type="Library" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/MultiharpComm/MultiharpComm.lvlib"/>
			<Item Name="SinglePhotonInterferenceUI.lvlib" Type="Library" URL="../UIs/SinglePhoton_UI/Libraries/SinglePhotonInterferenceUI/SinglePhotonInterferenceUI.lvlib"/>
		</Item>
		<Item Name="Cam_SLM_controller.lvlib" Type="Library" URL="../Top_Controllers/Cam_SLM_Controller/Cam_SLM_controller.lvlib"/>
		<Item Name="InitDeInit.lvlib" Type="Library" URL="../Interfaces/InitDeinitInterface/InitDeInit.lvlib"/>
		<Item Name="SPIController.lvlib" Type="Library" URL="../UIs/SinglePhoton_UI/Libraries/SPIController/SPIController.lvlib"/>
		<Item Name="ControllerComm.lvlib" Type="Library" URL="../UIs/ControllerComm.lvlib"/>
		<Item Name="Spectroscopy_Controller.lvlib" Type="Library" URL="../Top_Controllers/Spectroscopy_Controller/Spectroscopy_Controller.lvlib"/>
		<Item Name="TopController_Interface.lvlib" Type="Library" URL="../Top_Controllers/TopController_Interface.lvlib"/>
		<Item Name="SLMLibrary.lvlib" Type="Library" URL="../Interfaces/AbstractInstrumentClasses/SLM_LV/SLMLibrary.lvlib"/>
		<Item Name="typedefs.lvlib" Type="Library" URL="../typedefs/typedefs.lvlib"/>
		<Item Name="launcher.vi" Type="VI" URL="../UIs/SLM_Controller/launcher.vi"/>
		<Item Name="TranslationStageType.ctl" Type="VI" URL="../typedefs/TranslationStageType.ctl"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Actor Framework.lvlib" Type="Library" URL="/&lt;vilib&gt;/ActorFramework/Actor Framework.lvlib"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="NI_SystemLogging.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/SystemLogging/NI_SystemLogging.lvlib"/>
				<Item Name="Time-Delay Override Options.ctl" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delay Override Options.ctl"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="Casting Utility For Actors.vim" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Actor/Casting Utility For Actors.vim"/>
				<Item Name="IMAQ Image.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Image.ctl"/>
				<Item Name="IMAQ Dispose" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ Dispose"/>
				<Item Name="ROI Descriptor" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/ROI Descriptor"/>
				<Item Name="IMAQ Line" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Line"/>
				<Item Name="IMAQ Convert Line to ROI" Type="VI" URL="/&lt;vilib&gt;/vision/ROI Conversion.llb/IMAQ Convert Line to ROI"/>
				<Item Name="NI_Vision_Development_Module.lvlib" Type="Library" URL="/&lt;vilib&gt;/vision/NI_Vision_Development_Module.lvlib"/>
				<Item Name="IMAQ ImageToArray" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ ImageToArray"/>
				<Item Name="Color to RGB.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/Color to RGB.vi"/>
				<Item Name="IMAQ Overlay ROI" Type="VI" URL="/&lt;vilib&gt;/vision/Overlay.llb/IMAQ Overlay ROI"/>
				<Item Name="IMAQ Write TIFF File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write TIFF File 2"/>
				<Item Name="IMAQ Write PNG File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write PNG File 2"/>
				<Item Name="IMAQ Write JPEG2000 File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write JPEG2000 File 2"/>
				<Item Name="IMAQ Write JPEG File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write JPEG File 2"/>
				<Item Name="IMAQ Write Image And Vision Info File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write Image And Vision Info File 2"/>
				<Item Name="IMAQ Write BMP File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write BMP File 2"/>
				<Item Name="IMAQ Write File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write File 2"/>
				<Item Name="cfis_Replace Percent Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/cfis_Replace Percent Code.vi"/>
				<Item Name="cfis_Reverse Scan From String For Integer.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/cfis_Reverse Scan From String For Integer.vi"/>
				<Item Name="cfis_Get File Extension Without Changing Case.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/cfis_Get File Extension Without Changing Case.vi"/>
				<Item Name="cfis_Split File Path Into Three Parts.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/cfis_Split File Path Into Three Parts.vi"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Create File with Incrementing Suffix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Create File with Incrementing Suffix.vi"/>
				<Item Name="IMAQ SetImageSize" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ SetImageSize"/>
				<Item Name="Image Type" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/Image Type"/>
				<Item Name="IMAQ Create" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ Create"/>
				<Item Name="LVMinMaxIncTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVMinMaxIncTypeDef.ctl"/>
				<Item Name="IMAQ ArrayToImage" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ ArrayToImage"/>
				<Item Name="IMAQdx.ctl" Type="VI" URL="/&lt;vilib&gt;/userDefined/High Color/IMAQdx.ctl"/>
				<Item Name="NI_Vision_Acquisition_Software.lvlib" Type="Library" URL="/&lt;vilib&gt;/vision/driver/NI_Vision_Acquisition_Software.lvlib"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Trim Whitespace One-Sided.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace One-Sided.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="Get LV Class Default Value By Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Default Value By Name.vi"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
				<Item Name="LV70DateRecToTimeStamp.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/LV70DateRecToTimeStamp.vi"/>
				<Item Name="LVDateTimeRec.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVDateTimeRec.ctl"/>
				<Item Name="VariantType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/VariantDataType/VariantType.lvlib"/>
				<Item Name="Qualified Name Array To Single String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Qualified Name Array To Single String.vi"/>
				<Item Name="IMAQ Overlay Oval" Type="VI" URL="/&lt;vilib&gt;/vision/Overlay.llb/IMAQ Overlay Oval"/>
				<Item Name="Select Event Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/Select Event Type.ctl"/>
				<Item Name="Write Delimited Spreadsheet.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet.vi"/>
				<Item Name="Write Delimited Spreadsheet (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (DBL).vi"/>
				<Item Name="Write Spreadsheet String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Spreadsheet String.vi"/>
				<Item Name="Write Delimited Spreadsheet (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (I64).vi"/>
				<Item Name="Write Delimited Spreadsheet (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (string).vi"/>
				<Item Name="System Directory Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/System Directory Type.ctl"/>
				<Item Name="Get System Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/Get System Directory.vi"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="MB_VISA_Lock.lvlib" Type="Library" URL="/&lt;vilib&gt;/Plasmionique/MB Master/MB_VISA_Lock/MB_VISA_Lock.lvlib"/>
				<Item Name="UTF8 Tools.lvlib" Type="Library" URL="/&lt;vilib&gt;/addons/Tools/Unicode/UTF8 Tools.lvlib"/>
				<Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
				<Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
				<Item Name="VISA Configure Serial Port" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
			</Item>
			<Item Name="user.lib" Type="Folder">
				<Item Name="openg_error.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/error/error.llb/openg_error.lvlib"/>
				<Item Name="openg_variant.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/openg_variant.lvlib"/>
			</Item>
			<Item Name="AF Debug.lvlib" Type="Library" URL="/&lt;resource&gt;/AFDebug/AF Debug.lvlib"/>
			<Item Name="systemLogging.dll" Type="Document" URL="systemLogging.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
			<Item Name="tm_errorreport.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_errorreport.vi"/>
			<Item Name="tm_closecamera_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_closecamera_40.vi"/>
			<Item Name="tm_deinitialize_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_deinitialize_40.vi"/>
			<Item Name="tm_initialize_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_initialize_40.vi"/>
			<Item Name="tm_getframe16_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_getframe16_40.vi"/>
			<Item Name="tm_waitnextframe_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_waitnextframe_40.vi"/>
			<Item Name="tm_sensorcooler_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/advanced/tm_sensorcooler_40.vi"/>
			<Item Name="tm_setinputtrigger_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/trigger/tm_setinputtrigger_40.vi"/>
			<Item Name="tm_setparameter_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_setparameter_40.vi"/>
			<Item Name="tm_getparameter_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_getparameter_40.vi"/>
			<Item Name="tm_opencamera_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_opencamera_40.vi"/>
			<Item Name="tm_unpreparecapture_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_unpreparecapture_40.vi"/>
			<Item Name="tm_stopcapture_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_stopcapture_40.vi"/>
			<Item Name="tm_startcapture_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_startcapture_40.vi"/>
			<Item Name="tm_preparecapture_40.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaVIs/LV/Hamamatsu Video Capture [4423]/tm_preparecapture_40.vi"/>
			<Item Name="AddressType.ctl" Type="VI" URL="../typedefs/AddressType.ctl"/>
			<Item Name="BeamProfilerData.ctl" Type="VI" URL="../typedefs/BeamProfilerData.ctl"/>
			<Item Name="niimaqdx.dll" Type="Document" URL="niimaqdx.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivision.dll" Type="Document" URL="nivision.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivissvc.dll" Type="Document" URL="nivissvc.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="tmcamcon.dll" Type="Document" URL="tmcamcon.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Camera_Selected.ctl" Type="VI" URL="../../casc_correlations/Camera_Selected.ctl"/>
			<Item Name="ASI_States.ctl" Type="VI" URL="../../casc_correlations/ZWO/ASI_States.ctl"/>
			<Item Name="ASI_DataCluster.ctl" Type="VI" URL="../../casc_correlations/ZWO/ASI_DataCluster.ctl"/>
			<Item Name="Thorlabs.MotionControl.KCube.InertialMotorCLI.dll" Type="Document" URL="../UIs/TranslationStage_UI/Thorlabs.MotionControl.KCube.InertialMotorCLI.dll"/>
			<Item Name="MH_CTCStatus.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_CTCStatus.vi"/>
			<Item Name="MH_DllPath_global.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_DllPath_global.vi"/>
			<Item Name="MH_GetErrorString.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_GetErrorString.vi"/>
			<Item Name="MH_StopMeas.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_StopMeas.vi"/>
			<Item Name="MH_ClearHistMem.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_ClearHistMem.vi"/>
			<Item Name="MH_StartMeas.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_StartMeas.vi"/>
			<Item Name="MH_SetHistoLen.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_SetHistoLen.vi"/>
			<Item Name="MH_SetBinning.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_SetBinning.vi"/>
			<Item Name="MH_SetOffset.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_SetOffset.vi"/>
			<Item Name="MH_CloseDevice.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_CloseDevice.vi"/>
			<Item Name="MH_MeasMode.ctl" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/MH_MeasMode.ctl"/>
			<Item Name="MH_RefSource.ctl" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/MH_RefSource.ctl"/>
			<Item Name="InitMH_UIThread.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/InitMH_UIThread.vi"/>
			<Item Name="MH_GetLibraryVersion.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_GetLibraryVersion.vi"/>
			<Item Name="MH_OpenDevice.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_OpenDevice.vi"/>
			<Item Name="MH_Initialize.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_Initialize.vi"/>
			<Item Name="MH_GetHardwareInfo.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_GetHardwareInfo.vi"/>
			<Item Name="MH_GetFeatures.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_GetFeatures.vi"/>
			<Item Name="MH_GetNumOfInputChannels.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_GetNumOfInputChannels.vi"/>
			<Item Name="MH_GetBaseResolution.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_GetBaseResolution.vi"/>
			<Item Name="MH_SetSyncChannelOffset.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetSyncChannelOffset.vi"/>
			<Item Name="MH_SetSyncDeadTime.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetSyncDeadTime.vi"/>
			<Item Name="MH_SetSyncDiv.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetSyncDiv.vi"/>
			<Item Name="MH_SetInpChanData.ctl" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_SetInpChanData.ctl"/>
			<Item Name="MH_SetInpChanCmds.ctl" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_SetInpChanCmds.ctl"/>
			<Item Name="MH_InputChannel.ctl" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_InputChannel.ctl"/>
			<Item Name="SetInputChannels.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/SetInputChannels.vi"/>
			<Item Name="MH_SetInputChannelEnable.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_SetInputChannelEnable.vi"/>
			<Item Name="MH_SetInputChannelOffset.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_SetInputChannelOffset.vi"/>
			<Item Name="MH_SetInputDeadTime.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_SetInputDeadTime.vi"/>
			<Item Name="MH_SetInputEdgeTrg.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_SetInputEdgeTrg.vi"/>
			<Item Name="MH_SetSyncEdgeTrg.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetSyncEdgeTrg.vi"/>
			<Item Name="MH_ActorCluster.ctl" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Multiharp/MH_ActorCluster.ctl"/>
			<Item Name="MH_DataProcThread_QData.ctl" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_DataProcThread_QData.ctl"/>
			<Item Name="MH_DataProcThread_QCmds.ctl" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_DataProcThread_QCmds.ctl"/>
			<Item Name="MH_ReadFiFo.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_ReadFiFo.vi"/>
			<Item Name="MH_AllocateCntRateBuffer.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_AllocateCntRateBuffer.vi"/>
			<Item Name="MH_GetAllCountRates.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_GetAllCountRates.vi"/>
			<Item Name="MH_AllocateAllHistoBuffer.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_AllocateAllHistoBuffer.vi"/>
			<Item Name="MH_GetAllHistograms.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_GetAllHistograms.vi"/>
			<Item Name="MH_DataProcThread_Modified_T2.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_DataProcThread_Modified_T2.vi"/>
			<Item Name="MH_DataProcThread_QRef.ctl" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_DataProcThread_QRef.ctl"/>
			<Item Name="Get_Delays_Ctrl.ctl" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_OTF_Subtraction/Get_Delays_Ctrl.ctl"/>
			<Item Name="OTF_subtraction.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_OTF_Subtraction/OTF_subtraction.vi"/>
			<Item Name="ProcessTTRecMHT2.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/ProcessTTRecMHT2.vi"/>
			<Item Name="Count_Triggers.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_OTF_Subtraction/Count_Triggers.vi"/>
			<Item Name="AnalyzeEvent_Double.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_OTF_Subtraction/AnalyzeEvent_Double.vi"/>
			<Item Name="Count_Coincidences.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_OTF_Subtraction/Count_Coincidences.vi"/>
			<Item Name="GetDLLPath.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/GetDLLPath.vi"/>
			<Item Name="MH_CalcBinningValues.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_CalcBinningValues.vi"/>
			<Item Name="MH_InitChannels.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_InitChannels.vi"/>
			<Item Name="MH_InputChannel2.ctl" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_InputChannel2.ctl"/>
			<Item Name="MH_SetInputChannels.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_SetInputChannels.vi"/>
			<Item Name="MH_SetStopOverflow.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_SetStopOverflow.vi"/>
			<Item Name="CalcRate.vi" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/CalcRate.vi"/>
			<Item Name="JX_SetHome Msg.lvclass" Type="LVClass" URL="../ConcreteClasses/ConcreteInstrumentClasses/Jiaxin_Stepper_Controller/Jiaxin_Stepper_Controller Messages/JX_SetHome Msg/JX_SetHome Msg.lvclass"/>
			<Item Name="Read_Stage_Variant.vi" Type="VI" URL="../UIs/TranslationStage_UI/Read_Stage_Variant.vi"/>
			<Item Name="MH_UIThread_Data_SPI.ctl" Type="VI" URL="../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_UIThread_Data_SPI.ctl"/>
			<Item Name="Mean_stdev_Calculation.vi" Type="VI" URL="../UIs/SinglePhoton_UI/Libraries/SinglePhotonInterferenceUI/SinglePhotonInterferenceUI/Mean_stdev_Calculation.vi"/>
			<Item Name="Calc_Allan-Variance.VI" Type="VI" URL="../UIs/SinglePhoton_UI/Libraries/SinglePhotonInterferenceUI/SinglePhotonInterferenceUI/Calc_Allan-Variance.VI"/>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="MH_SetAllChannels.vi" Type="VI" URL="../UIs/SinglePhoton_UI/Libraries/SinglePhotonInterferenceUI/SinglePhotonInterferenceUI/MH_SetAllChannels.vi"/>
			<Item Name="EnableControls.vi" Type="VI" URL="../SubVIs/EnableControls.vi"/>
			<Item Name="Thorlabs.MotionControl.KCube.InertialMotorCLI.dll" Type="Document" URL="../Thorlabs.MotionControl.KCube.InertialMotorCLI.dll"/>
			<Item Name="Thorlabs.MotionControl.Controls.dll" Type="Document" URL="../Thorlabs.MotionControl.Controls.dll"/>
			<Item Name="Thorlabs.MotionControl.Benchtop.PiezoCLI.dll" Type="Document" URL="../Thorlabs.MotionControl.Benchtop.PiezoCLI.dll"/>
		</Item>
		<Item Name="Build Specifications" Type="Build">
			<Item Name="SLM_Controller" Type="EXE">
				<Property Name="App_copyErrors" Type="Bool">true</Property>
				<Property Name="App_INI_aliasGUID" Type="Str">{60150518-C41A-4242-B221-13108F262107}</Property>
				<Property Name="App_INI_GUID" Type="Str">{6530C47A-42FF-4213-B1D4-28471E0B6E06}</Property>
				<Property Name="App_serverConfig.httpPort" Type="Int">8002</Property>
				<Property Name="App_serverType" Type="Int">0</Property>
				<Property Name="Bld_autoIncrement" Type="Bool">true</Property>
				<Property Name="Bld_buildCacheID" Type="Str">{2F6BDA40-210B-4D8C-91F5-8492971C15C2}</Property>
				<Property Name="Bld_buildSpecName" Type="Str">SLM_Controller</Property>
				<Property Name="Bld_excludeInlineSubVIs" Type="Bool">true</Property>
				<Property Name="Bld_excludeLibraryItems" Type="Bool">true</Property>
				<Property Name="Bld_excludePolymorphicVIs" Type="Bool">true</Property>
				<Property Name="Bld_localDestDir" Type="Path">/C/Users/quantum/Documents/LVDAQ/builds</Property>
				<Property Name="Bld_modifyLibraryFile" Type="Bool">true</Property>
				<Property Name="Bld_previewCacheID" Type="Str">{F2CDB9AA-1248-4A98-A0F4-527E3CE69E4E}</Property>
				<Property Name="Bld_version.build" Type="Int">4</Property>
				<Property Name="Bld_version.major" Type="Int">1</Property>
				<Property Name="Destination[0].destName" Type="Str">SLM_Controller.exe</Property>
				<Property Name="Destination[0].path" Type="Path">/C/Users/quantum/Documents/LVDAQ/builds/SLM_Controller.exe</Property>
				<Property Name="Destination[0].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="Destination[0].preserveHierarchy" Type="Bool">true</Property>
				<Property Name="Destination[0].type" Type="Str">App</Property>
				<Property Name="Destination[1].destName" Type="Str">Support Directory</Property>
				<Property Name="Destination[1].path" Type="Path">/C/Users/quantum/Documents/LVDAQ/builds/data</Property>
				<Property Name="Destination[1].path.type" Type="Str">&lt;none&gt;</Property>
				<Property Name="DestinationCount" Type="Int">2</Property>
				<Property Name="Source[0].itemID" Type="Str">{D4BC72DC-4F67-4869-9400-F0B04BD8314D}</Property>
				<Property Name="Source[0].type" Type="Str">Container</Property>
				<Property Name="Source[1].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[1].itemID" Type="Ref">/My Computer/launcher.vi</Property>
				<Property Name="Source[1].sourceInclusion" Type="Str">TopLevel</Property>
				<Property Name="Source[1].type" Type="Str">VI</Property>
				<Property Name="Source[10].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[10].itemID" Type="Ref">/My Computer/Cam_SLM_controller.lvlib</Property>
				<Property Name="Source[10].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[10].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[10].type" Type="Str">Library</Property>
				<Property Name="Source[2].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[2].itemID" Type="Ref">/My Computer/InitDeInit.lvlib</Property>
				<Property Name="Source[2].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[2].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[2].type" Type="Str">Library</Property>
				<Property Name="Source[3].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[3].itemID" Type="Ref">/My Computer/SLMLibrary.lvlib/SLMInterface.lvlib</Property>
				<Property Name="Source[3].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[3].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[3].type" Type="Str">Library</Property>
				<Property Name="Source[4].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[4].itemID" Type="Ref">/My Computer/SLMLibrary.lvlib/SLM_Controller.lvlib</Property>
				<Property Name="Source[4].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[4].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[4].type" Type="Str">Library</Property>
				<Property Name="Source[5].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[5].itemID" Type="Ref">/My Computer/SLMLibrary.lvlib/SLMComm.lvlib</Property>
				<Property Name="Source[5].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[5].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[5].type" Type="Str">Library</Property>
				<Property Name="Source[6].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[6].itemID" Type="Ref">/My Computer/Camera Library/Camera_Controller.lvlib</Property>
				<Property Name="Source[6].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[6].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[6].type" Type="Str">Library</Property>
				<Property Name="Source[7].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[7].itemID" Type="Ref">/My Computer/Camera Library/Inovance_Camera.lvlib</Property>
				<Property Name="Source[7].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[7].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[7].type" Type="Str">Library</Property>
				<Property Name="Source[8].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[8].itemID" Type="Ref">/My Computer/Camera Library/Hamamatsu_Camera.lvlib</Property>
				<Property Name="Source[8].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[8].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[8].type" Type="Str">Library</Property>
				<Property Name="Source[9].destinationIndex" Type="Int">0</Property>
				<Property Name="Source[9].itemID" Type="Ref">/My Computer/typedefs.lvlib</Property>
				<Property Name="Source[9].Library.allowMissingMembers" Type="Bool">true</Property>
				<Property Name="Source[9].sourceInclusion" Type="Str">Include</Property>
				<Property Name="Source[9].type" Type="Str">Library</Property>
				<Property Name="SourceCount" Type="Int">11</Property>
				<Property Name="TgtF_companyName" Type="Str">Westlake university</Property>
				<Property Name="TgtF_fileDescription" Type="Str">SLM_Controller</Property>
				<Property Name="TgtF_internalName" Type="Str">SLM_Controller</Property>
				<Property Name="TgtF_legalCopyright" Type="Str">Copyright © 2024 Westlake university</Property>
				<Property Name="TgtF_productName" Type="Str">SLM_Controller</Property>
				<Property Name="TgtF_targetfileGUID" Type="Str">{DF8D9D84-BF6E-4B1A-BEB5-E08E65D1026A}</Property>
				<Property Name="TgtF_targetfileName" Type="Str">SLM_Controller.exe</Property>
				<Property Name="TgtF_versionIndependent" Type="Bool">true</Property>
			</Item>
		</Item>
	</Item>
</Project>
