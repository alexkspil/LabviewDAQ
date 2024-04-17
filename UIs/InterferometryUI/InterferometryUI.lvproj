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
			<Item Name="InitDeinit" Type="Folder">
				<Item Name="InitDeinit.lvclass" Type="LVClass" URL="../../../Interfaces/InitDeinitInterface/InitDeinit/InitDeinit.lvclass"/>
			</Item>
			<Item Name="InitDeinit Messages" Type="Folder"/>
			<Item Name="InitDeinitComm" Type="Folder">
				<Item Name="InitDeinitComm.lvclass" Type="LVClass" URL="../../../Interfaces/InitDeinitInterface/InitDeinitComm/InitDeinitComm.lvclass"/>
			</Item>
			<Item Name="InitDeinitComm Messages" Type="Folder">
				<Item Name="FoundInstruments Msg" Type="Folder">
					<Item Name="FoundInstruments Msg.lvclass" Type="LVClass" URL="../../../Interfaces/InitDeinitInterface/InitDeinitComm Messages/FoundInstruments Msg/FoundInstruments Msg.lvclass"/>
				</Item>
				<Item Name="InitDone Msg" Type="Folder">
					<Item Name="InitDone Msg.lvclass" Type="LVClass" URL="../../../Interfaces/InitDeinitInterface/InitDeinitComm Messages/InitDone Msg/InitDone Msg.lvclass"/>
				</Item>
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
			<Item Name="TranslationStages" Type="Folder">
				<Item Name="TranslationStagesInterface.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStageInterface/TranslationStagesInterface.lvclass"/>
			</Item>
			<Item Name="TranslationStagesComm" Type="Folder">
				<Item Name="TranslationStagesComm.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStagesComm/TranslationStagesComm.lvclass"/>
			</Item>
			<Item Name="TranslationStagesComm Messages" Type="Folder">
				<Item Name="LimitReached Msg" Type="Folder">
					<Item Name="LimitReached Msg.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStagesComm Messages/LimitReached Msg/LimitReached Msg.lvclass"/>
				</Item>
				<Item Name="StageMoveDone Msg" Type="Folder">
					<Item Name="StageMoveDone Msg.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStagesComm Messages/StageMoveDone Msg/StageMoveDone Msg.lvclass"/>
				</Item>
			</Item>
			<Item Name="CameraInterface" Type="Folder">
				<Item Name="CameraInterface.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface/CameraInterface.lvclass"/>
			</Item>
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
		<Item Name="instrumentType.ctl" Type="VI" URL="../InterferometryUI/instrumentType.ctl"/>
		<Item Name="InstrumentData.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaCam/HamaCam/InstrumentData.ctl"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="user.lib" Type="Folder">
				<Item Name="ASICamera2_no_err.lvlib" Type="Library" URL="/&lt;userlib&gt;/ASICamera2_no_err/ASICamera2_no_err.lvlib"/>
			</Item>
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
			</Item>
			<Item Name="AF Debug.lvlib" Type="Library" URL="/&lt;resource&gt;/AFDebug/AF Debug.lvlib"/>
			<Item Name="ASICamera2.dll" Type="Document" URL="ASICamera2.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
			<Item Name="systemLogging.framework" Type="Document" URL="systemLogging.framework">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
