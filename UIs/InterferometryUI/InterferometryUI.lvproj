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
		<Item Name="InstrumentsConcrete" Type="Folder">
			<Item Name="ArduinoTranslationStage" Type="Folder">
				<Item Name="ArduinoTranslationStage.lvlib" Type="Library" URL="../../ArduinoTranslationStageUI/ArduinoTranslationStage.lvlib"/>
			</Item>
			<Item Name="ZWO_ASI" Type="Folder">
				<Item Name="ASI_bufferToImage_Array.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/ZWO_ASI_LV/ASI_bufferToImage_Array.vi"/>
				<Item Name="ZWO_ASI.lvlib" Type="Library" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/ZWO_ASI_LV/ZWO_ASI.lvlib"/>
			</Item>
		</Item>
		<Item Name="Interfaces" Type="Folder">
			<Item Name="CameraDAQ" Type="Folder">
				<Item Name="CameraDAQ.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraDAQ/CameraDAQ.lvclass"/>
			</Item>
			<Item Name="CameraDAQ Messages" Type="Folder">
				<Item Name="GrabFrame Msg" Type="Folder">
					<Item Name="GrabFrame Msg.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraDAQ Messages/GrabFrame Msg/GrabFrame Msg.lvclass"/>
				</Item>
			</Item>
			<Item Name="InitDeinit" Type="Folder"/>
			<Item Name="InitDeinit Messages" Type="Folder"/>
			<Item Name="InitDeinitComm" Type="Folder"/>
			<Item Name="InitDeinitComm Messages" Type="Folder">
				<Item Name="FoundInstruments Msg" Type="Folder"/>
				<Item Name="InitDone Msg" Type="Folder"/>
			</Item>
			<Item Name="StepperMotorController" Type="Folder">
				<Item Name="StepperMotorController.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/StepperMotorControllers_LV/StepperMotorController/StepperMotorController.lvclass"/>
			</Item>
			<Item Name="StepperMotorController Messages" Type="Folder">
				<Item Name="ReadOutput Msg" Type="Folder">
					<Item Name="ReadOutput Msg.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/StepperMotorControllers_LV/StepperMotorController Messages/ReadOutput Msg/ReadOutput Msg.lvclass"/>
				</Item>
				<Item Name="WriteCommand Msg" Type="Folder">
					<Item Name="WriteCommand Msg.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/StepperMotorControllers_LV/StepperMotorController Messages/WriteCommand Msg/WriteCommand Msg.lvclass"/>
				</Item>
			</Item>
			<Item Name="TranslationStages" Type="Folder"/>
			<Item Name="TranslationStagesComm" Type="Folder"/>
			<Item Name="TranslationStagesComm Messages" Type="Folder">
				<Item Name="LimitReached Msg" Type="Folder"/>
				<Item Name="StageMoveDone Msg" Type="Folder"/>
			</Item>
			<Item Name="CameraInterface" Type="Folder"/>
		</Item>
		<Item Name="User Interface" Type="Folder">
			<Item Name="InterferometryUI" Type="Folder">
				<Property Name="NI.SortType" Type="Int">3</Property>
				<Item Name="InterferometryUI" Type="Folder">
					<Property Name="NI.SortType" Type="Int">3</Property>
					<Item Name="InterferometryUI.lvlib" Type="Library" URL="../InterferometryUI.lvlib"/>
				</Item>
				<Item Name="InterferometryUI.aliases" Type="Document" URL="../InterferometryUI.aliases"/>
				<Item Name="InterferometryUI.lvlps" Type="Document" URL="../InterferometryUI.lvlps"/>
				<Item Name="launcher.vi" Type="VI" URL="../launcher.vi"/>
			</Item>
		</Item>
		<Item Name="typedefs.lvlib" Type="Library" URL="../../../typedefs/typedefs.lvlib"/>
		<Item Name="InterferometryUIPublicData.ctl" Type="VI" URL="../InterferometryUI/InterferometryUIPublicData.ctl"/>
		<Item Name="ASICamera2_no_err.lvlib" Type="Library" URL="/&lt;userlib&gt;/ASICamera2_no_err/ASICamera2_no_err.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Actor Framework.lvlib" Type="Library" URL="/&lt;vilib&gt;/ActorFramework/Actor Framework.lvlib"/>
				<Item Name="Casting Utility For Actors.vim" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Actor/Casting Utility For Actors.vim"/>
				<Item Name="cfis_Get File Extension Without Changing Case.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/cfis_Get File Extension Without Changing Case.vi"/>
				<Item Name="cfis_Replace Percent Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/cfis_Replace Percent Code.vi"/>
				<Item Name="cfis_Reverse Scan From String For Integer.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/cfis_Reverse Scan From String For Integer.vi"/>
				<Item Name="cfis_Split File Path Into Three Parts.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/cfis_Split File Path Into Three Parts.vi"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="Create File with Incrementing Suffix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Create File with Incrementing Suffix.vi"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="NI_SystemLogging.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/SystemLogging/NI_SystemLogging.lvlib"/>
				<Item Name="RGB to Color.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/RGB to Color.vi"/>
				<Item Name="Select Event Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/Select Event Type.ctl"/>
				<Item Name="Time-Delay Override Options.ctl" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delay Override Options.ctl"/>
				<Item Name="Write Delimited Spreadsheet (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (DBL).vi"/>
				<Item Name="Write Delimited Spreadsheet (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (I64).vi"/>
				<Item Name="Write Delimited Spreadsheet (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (string).vi"/>
				<Item Name="Write Delimited Spreadsheet.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet.vi"/>
				<Item Name="Write Spreadsheet String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Spreadsheet String.vi"/>
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
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="subDisplayMessage.vi" Type="VI" URL="/&lt;vilib&gt;/express/express output/DisplayMessageBlock.llb/subDisplayMessage.vi"/>
				<Item Name="IMAQ Image.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Image.ctl"/>
			</Item>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
			<Item Name="ASICamera2_no_err.lvlib" Type="Library" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/ZWO_ASI_LV/Labview_ASI_demo_64bit_221128/user.lib/ASICamera2_no_err/ASICamera2_no_err.lvlib"/>
			<Item Name="AF Debug.lvlib" Type="Library" URL="/&lt;resource&gt;/AFDebug/AF Debug.lvlib"/>
			<Item Name="ASICamera2.dll" Type="Document" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/ZWO_ASI_LV/Labview_ASI_demo_64bit_221128/user.lib/ASICamera2_no_err/ASICamera2.dll"/>
			<Item Name="OpenCamera Msg.lvclass" Type="LVClass" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/ZWO_ASI_LV/ZWO_ASI Messages/OpenCamera Msg/OpenCamera Msg.lvclass"/>
			<Item Name="systemLogging.dll" Type="Document" URL="systemLogging.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Thorlabs.MotionControl.KCube.InertialMotorCLI.dll" Type="Document" URL="../../TranslationStage_UI/Thorlabs.MotionControl.KCube.InertialMotorCLI.dll"/>
			<Item Name="StageMoveDone Msg.lvclass" Type="LVClass" URL="../../TranslationStage_UI/TranslationStage_UI Messages/StageMoveDone Msg/StageMoveDone Msg.lvclass"/>
			<Item Name="KIM101_UI.lvclass" Type="LVClass" URL="../../TranslationStage_UI/TranslationStage_UI/KIM101_UI.lvclass"/>
			<Item Name="InitDeInit.lvlib" Type="Library" URL="../../../Interfaces/InitDeinitInterface/InitDeInit.lvlib"/>
			<Item Name="TranslationStage.lvlib" Type="Library" URL="../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStageInterface/TranslationStage.lvlib"/>
			<Item Name="FoundInstruments.ctl" Type="VI" URL="../../SinglePhoton_UI/typedefs/FoundInstruments.ctl"/>
			<Item Name="TranslationStagesComm.lvlib" Type="Library" URL="../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStagesComm/TranslationStagesComm.lvlib"/>
			<Item Name="Send GrabFrame.vi" Type="VI" URL="../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraDAQ Messages/GrabFrame Msg/Send GrabFrame.vi"/>
			<Item Name="CameraInterface.lvlib" Type="Library" URL="../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface/CameraInterface.lvlib"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
