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
		<Item Name="Init DeInit Messages" Type="Folder">
			<Item Name="DeInit Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinit Messages/DeInit Msg/DeInit Msg.lvclass"/>
			<Item Name="Disconnect Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinit Messages/Disconnect Msg/Disconnect Msg.lvclass"/>
			<Item Name="Init Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinit Messages/Init Msg/Init Msg.lvclass"/>
		</Item>
		<Item Name="InitDeinitComm" Type="Folder">
			<Item Name="InitDeinitComm.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinitComm/InitDeinitComm.lvclass"/>
		</Item>
		<Item Name="InitDeinitComm Messages" Type="Folder">
			<Item Name="DeInit Done Msg" Type="Folder">
				<Item Name="DeInit Done Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinitComm Messages/DeInit Done Msg/DeInit Done Msg.lvclass"/>
			</Item>
			<Item Name="Disconnected Msg" Type="Folder">
				<Item Name="Disconnected Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinitComm Messages/Disconnected Msg/Disconnected Msg.lvclass"/>
			</Item>
			<Item Name="InitDone Msg" Type="Folder">
				<Item Name="InitDone Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinitComm Messages/InitDone Msg/InitDone Msg.lvclass"/>
			</Item>
		</Item>
		<Item Name="CameraComm" Type="Folder">
			<Item Name="CameraComm.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraComm/CameraComm.lvclass"/>
		</Item>
		<Item Name="CameraComm Messages" Type="Folder">
			<Item Name="Capture Started Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraComm Messages/Capture Started Msg/Capture Started Msg.lvclass"/>
			<Item Name="Capture Stopped Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraComm Messages/Capture Stopped Msg/Capture Stopped Msg.lvclass"/>
			<Item Name="Gain Set Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraComm Messages/Gain Set Msg/Gain Set Msg.lvclass"/>
			<Item Name="Frame Ready Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraComm Messages/Frame Ready Msg/Frame Ready Msg.lvclass"/>
			<Item Name="Exposure Set Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraComm Messages/Exposure Set Msg/Exposure Set Msg.lvclass"/>
			<Item Name="Cam Init Done Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraComm Messages/Cam Init Done Msg/Cam Init Done Msg.lvclass"/>
			<Item Name="Cam DeInit Done Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraComm Messages/Cam DeInit Done Msg/Cam DeInit Done Msg.lvclass"/>
		</Item>
		<Item Name="Camera Messages" Type="Folder">
			<Item Name="SingleAcquisition Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface Messages/SingleAcquisition Msg/SingleAcquisition Msg.lvclass"/>
			<Item Name="SetExposure Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface Messages/SetExposure Msg/SetExposure Msg.lvclass"/>
			<Item Name="Set Gain Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface Messages/Set Gain Msg/Set Gain Msg.lvclass"/>
			<Item Name="StartCapture Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface Messages/StartCapture Msg/StartCapture Msg.lvclass"/>
			<Item Name="StopCapture Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface Messages/StopCapture Msg/StopCapture Msg.lvclass"/>
			<Item Name="GetFrame Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface Messages/GetFrame Msg/GetFrame Msg.lvclass"/>
		</Item>
		<Item Name="InitDeinit.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinit/InitDeinit.lvclass"/>
		<Item Name="CameraInterface.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface/CameraInterface.lvclass"/>
		<Item Name="CameraOptionsInterface.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraOptionsInterface/CameraOptionsInterface.lvclass"/>
		<Item Name="Inovance_Camera.lvlib" Type="Library" URL="../Inovance_Camera/Inovance_Camera.lvlib"/>
		<Item Name="Camera_Controller.lvlib" Type="Library" URL="../../../../../UIs/Camera_Controller/Camera_Controller.lvlib"/>
		<Item Name="launcher.vi" Type="VI" URL="../../../../../UIs/Camera_Controller/launcher.vi"/>
		<Item Name="typedefs.lvlib" Type="Library" URL="../../../../../typedefs/typedefs.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Actor Framework.lvlib" Type="Library" URL="/&lt;vilib&gt;/ActorFramework/Actor Framework.lvlib"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="NI_SystemLogging.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/SystemLogging/NI_SystemLogging.lvlib"/>
				<Item Name="Time-Delay Override Options.ctl" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delay Override Options.ctl"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="Casting Utility For Actors.vim" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Actor/Casting Utility For Actors.vim"/>
				<Item Name="IMAQdx.ctl" Type="VI" URL="/&lt;vilib&gt;/userDefined/High Color/IMAQdx.ctl"/>
				<Item Name="NI_Vision_Acquisition_Software.lvlib" Type="Library" URL="/&lt;vilib&gt;/vision/driver/NI_Vision_Acquisition_Software.lvlib"/>
				<Item Name="IMAQ Image.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Image.ctl"/>
				<Item Name="NI_Vision_Development_Module.lvlib" Type="Library" URL="/&lt;vilib&gt;/vision/NI_Vision_Development_Module.lvlib"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="Trim Whitespace One-Sided.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace One-Sided.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="IMAQ Dispose" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ Dispose"/>
				<Item Name="IMAQ Create" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ Create"/>
				<Item Name="Image Type" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/Image Type"/>
				<Item Name="ROI Descriptor" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/ROI Descriptor"/>
				<Item Name="IMAQ Line" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Line"/>
				<Item Name="IMAQ Convert Line to ROI" Type="VI" URL="/&lt;vilib&gt;/vision/ROI Conversion.llb/IMAQ Convert Line to ROI"/>
				<Item Name="IMAQ SetImageSize" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ SetImageSize"/>
				<Item Name="Color to RGB.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/Color to RGB.vi"/>
				<Item Name="IMAQ Overlay ROI" Type="VI" URL="/&lt;vilib&gt;/vision/Overlay.llb/IMAQ Overlay ROI"/>
				<Item Name="IMAQ ImageToArray" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ ImageToArray"/>
				<Item Name="IMAQ Write JPEG File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write JPEG File 2"/>
				<Item Name="IMAQ Write TIFF File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write TIFF File 2"/>
				<Item Name="IMAQ Write PNG File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write PNG File 2"/>
				<Item Name="IMAQ Write JPEG2000 File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write JPEG2000 File 2"/>
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
			</Item>
			<Item Name="AF Debug.lvlib" Type="Library" URL="/&lt;resource&gt;/AFDebug/AF Debug.lvlib"/>
			<Item Name="AddressType.ctl" Type="VI" URL="../../../../../typedefs/AddressType.ctl"/>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
			<Item Name="systemLogging.dll" Type="Document" URL="systemLogging.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="niimaqdx.dll" Type="Document" URL="niimaqdx.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="ASI_States.ctl" Type="VI" URL="../../../../../../casc_correlations/ZWO/ASI_States.ctl"/>
			<Item Name="ASI_DataCluster.ctl" Type="VI" URL="../../../../../../casc_correlations/ZWO/ASI_DataCluster.ctl"/>
			<Item Name="Camera_Selected.ctl" Type="VI" URL="../../../../../../casc_correlations/Camera_Selected.ctl"/>
			<Item Name="nivision.dll" Type="Document" URL="nivision.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivissvc.dll" Type="Document" URL="nivissvc.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
