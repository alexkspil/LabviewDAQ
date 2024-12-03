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
		<Item Name="InitDeInit.lvlib" Type="Library" URL="../../../Interfaces/InitDeinitInterface/InitDeInit.lvlib"/>
		<Item Name="BPC30x.lvlib" Type="Library" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/BPC301/BPC30x.lvlib"/>
		<Item Name="Jiaxin_Stepper_Controller.lvlib" Type="Library" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Jiaxin_Stepper_Controller/Jiaxin_Stepper_Controller.lvlib"/>
		<Item Name="KIM101.lvlib" Type="Library" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/KIM101/KIM101.lvlib"/>
		<Item Name="MB Master.lvlib" Type="Library" URL="/&lt;vilib&gt;/Plasmionique/MB Master/MB Master.lvlib"/>
		<Item Name="Read_Stage_Variant.vi" Type="VI" URL="../Read_Stage_Variant.vi"/>
		<Item Name="TranslationStage.lvlib" Type="Library" URL="../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStageInterface/TranslationStage.lvlib"/>
		<Item Name="TranslationStage_UI.lvlib" Type="Library" URL="../TranslationStage_UI.lvlib"/>
		<Item Name="TranslationStagesComm.lvlib" Type="Library" URL="../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStagesComm/TranslationStagesComm.lvlib"/>
		<Item Name="TranslationStagesCommMessages.lvlib" Type="Library" URL="../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStagesComm Messages/TranslationStagesCommMessages.lvlib"/>
		<Item Name="TranslationStagesInterface Messages.lvlib" Type="Library" URL="../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStagesInterface Messages/TranslationStagesInterface Messages.lvlib"/>
		<Item Name="Build_Mask Write Holding Register.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Jiaxin_Stepper_Controller/Plasmionique/MB Master/MB_PDU/Build_Mask Write Holding Register.vi"/>
		<Item Name="SPI_v2_launcher.vi" Type="VI" URL="../../SinglePhoton_UI/SPI_v2_launcher.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Actor Framework.lvlib" Type="Library" URL="/&lt;vilib&gt;/ActorFramework/Actor Framework.lvlib"/>
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Casting Utility For Actors.vim" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Actor/Casting Utility For Actors.vim"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="General Error Handler Core CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler Core CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="IMAQ Image.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Image.ctl"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="LVRectTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVRectTypeDef.ctl"/>
				<Item Name="MB_VISA_Lock.lvlib" Type="Library" URL="/&lt;vilib&gt;/Plasmionique/MB Master/MB_VISA_Lock/MB_VISA_Lock.lvlib"/>
				<Item Name="NI_SystemLogging.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/SystemLogging/NI_SystemLogging.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="Simple Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Simple Error Handler.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Time-Delay Override Options.ctl" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delay Override Options.ctl"/>
				<Item Name="Trim Whitespace One-Sided.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace One-Sided.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Get LV Class Default Value By Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Default Value By Name.vi"/>
				<Item Name="NI_Data Type.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/Data Type/NI_Data Type.lvlib"/>
				<Item Name="LV70DateRecToTimeStamp.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/LV70DateRecToTimeStamp.vi"/>
				<Item Name="LVDateTimeRec.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVDateTimeRec.ctl"/>
				<Item Name="VariantType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/VariantDataType/VariantType.lvlib"/>
				<Item Name="Qualified Name Array To Single String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Qualified Name Array To Single String.vi"/>
				<Item Name="System Directory Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/System Directory Type.ctl"/>
				<Item Name="Get System Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/sysdir.llb/Get System Directory.vi"/>
				<Item Name="Application Directory.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Application Directory.vi"/>
				<Item Name="NI_FileType.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/lvfile.llb/NI_FileType.lvlib"/>
				<Item Name="Check if File or Folder Exists.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/libraryn.llb/Check if File or Folder Exists.vi"/>
				<Item Name="NI_PackedLibraryUtility.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/LVLibp/NI_PackedLibraryUtility.lvlib"/>
				<Item Name="subFile Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/express/express input/FileDialogBlock.llb/subFile Dialog.vi"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="Create File with Incrementing Suffix.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Create File with Incrementing Suffix.vi"/>
				<Item Name="cfis_Replace Percent Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/cfis_Replace Percent Code.vi"/>
				<Item Name="cfis_Split File Path Into Three Parts.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/cfis_Split File Path Into Three Parts.vi"/>
				<Item Name="cfis_Get File Extension Without Changing Case.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/cfis_Get File Extension Without Changing Case.vi"/>
				<Item Name="cfis_Reverse Scan From String For Integer.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/cfis_Reverse Scan From String For Integer.vi"/>
				<Item Name="Write Delimited Spreadsheet.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet.vi"/>
				<Item Name="Write Delimited Spreadsheet (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (DBL).vi"/>
				<Item Name="Write Spreadsheet String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Spreadsheet String.vi"/>
				<Item Name="Write Delimited Spreadsheet (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (I64).vi"/>
				<Item Name="Write Delimited Spreadsheet (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Delimited Spreadsheet (string).vi"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
			</Item>
			<Item Name="user.lib" Type="Folder">
				<Item Name="openg_variant.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/lvdata/lvdata.llb/openg_variant.lvlib"/>
				<Item Name="openg_error.lvlib" Type="Library" URL="/&lt;userlib&gt;/_OpenG.lib/error/error.llb/openg_error.lvlib"/>
			</Item>
			<Item Name="AF Debug.lvlib" Type="Library" URL="/&lt;resource&gt;/AFDebug/AF Debug.lvlib"/>
			<Item Name="JX_MoveBySteps.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Jiaxin_Stepper_Controller/Jiaxin_Stepper_Controller/JX_MoveBySteps.vi"/>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
			<Item Name="systemLogging.dll" Type="Document" URL="systemLogging.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Thorlabs.MotionControl.KCube.InertialMotorCLI.dll" Type="Document" URL="../../SinglePhotonUI/Thorlabs.MotionControl.KCube.InertialMotorCLI.dll"/>
			<Item Name="typedefs.lvlib" Type="Library" URL="../../../typedefs/typedefs.lvlib"/>
			<Item Name="MH_UIThread_Data_SPI.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_UIThread_Data_SPI.ctl"/>
			<Item Name="MH_InputChannel.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_InputChannel.ctl"/>
			<Item Name="MH_SetInpChanData.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_SetInpChanData.ctl"/>
			<Item Name="MH_SetInpChanCmds.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_SetInpChanCmds.ctl"/>
			<Item Name="MH_MeasMode.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/MH_MeasMode.ctl"/>
			<Item Name="MH_DllPath_global.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_DllPath_global.vi"/>
			<Item Name="GetDLLPath.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/GetDLLPath.vi"/>
			<Item Name="MH_CalcBinningValues.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_CalcBinningValues.vi"/>
			<Item Name="MH_InitChannels.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_InitChannels.vi"/>
			<Item Name="MH_InputChannel2.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_InputChannel2.ctl"/>
			<Item Name="MH_SetInputChannels.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_SetInputChannels.vi"/>
			<Item Name="MH_SetStopOverflow.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_SetStopOverflow.vi"/>
			<Item Name="MH_GetErrorString.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_GetErrorString.vi"/>
			<Item Name="CalcRate.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/CalcRate.vi"/>
			<Item Name="Multiharp.lvlib" Type="Library" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Multiharp.lvlib"/>
			<Item Name="MH_CTCStatus.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_CTCStatus.vi"/>
			<Item Name="MH_StopMeas.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_StopMeas.vi"/>
			<Item Name="MH_ClearHistMem.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_ClearHistMem.vi"/>
			<Item Name="MH_StartMeas.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_StartMeas.vi"/>
			<Item Name="MH_SetHistoLen.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetHistoLen.vi"/>
			<Item Name="MH_SetBinning.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetBinning.vi"/>
			<Item Name="MH_SetOffset.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetOffset.vi"/>
			<Item Name="MultiharpComm.lvlib" Type="Library" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/MultiharpComm/MultiharpComm.lvlib"/>
			<Item Name="MH_CloseDevice.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_CloseDevice.vi"/>
			<Item Name="MH_RefSource.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/MH_RefSource.ctl"/>
			<Item Name="InitMH_UIThread.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/InitMH_UIThread.vi"/>
			<Item Name="MH_GetLibraryVersion.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_GetLibraryVersion.vi"/>
			<Item Name="MH_OpenDevice.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_OpenDevice.vi"/>
			<Item Name="MH_Initialize.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_Initialize.vi"/>
			<Item Name="MH_GetHardwareInfo.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_GetHardwareInfo.vi"/>
			<Item Name="MH_GetFeatures.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_GetFeatures.vi"/>
			<Item Name="MH_GetNumOfInputChannels.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_GetNumOfInputChannels.vi"/>
			<Item Name="MH_GetBaseResolution.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_GetBaseResolution.vi"/>
			<Item Name="MH_SetSyncChannelOffset.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetSyncChannelOffset.vi"/>
			<Item Name="MH_SetSyncDeadTime.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetSyncDeadTime.vi"/>
			<Item Name="MH_SetSyncDiv.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetSyncDiv.vi"/>
			<Item Name="SetInputChannels.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/SetInputChannels.vi"/>
			<Item Name="MH_SetInputChannelEnable.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_SetInputChannelEnable.vi"/>
			<Item Name="MH_SetInputChannelOffset.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetInputChannelOffset.vi"/>
			<Item Name="MH_SetInputDeadTime.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetInputDeadTime.vi"/>
			<Item Name="MH_SetInputEdgeTrg.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetInputEdgeTrg.vi"/>
			<Item Name="MH_SetSyncEdgeTrg.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_SetSyncEdgeTrg.vi"/>
			<Item Name="MH_GetAllCountRates.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_GetAllCountRates.vi"/>
			<Item Name="MH_AllocateCntRateBuffer.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_AllocateCntRateBuffer.vi"/>
			<Item Name="MH_GetAllHistograms.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_UIThread.llb/MH_GetAllHistograms.vi"/>
			<Item Name="MH_AllocateAllHistoBuffer.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_AllocateAllHistoBuffer.vi"/>
			<Item Name="MH_ReadFiFo.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/_lib/PQ/MultiHarp/mhlib_x86_x64_AnyThread.llb/MH_ReadFiFo.vi"/>
			<Item Name="MH_DataProcThread_Modified_T2.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_DataProcThread_Modified_T2.vi"/>
			<Item Name="OTF_subtraction.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_OTF_Subtraction/OTF_subtraction.vi"/>
			<Item Name="Get_Delays_Ctrl.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_OTF_Subtraction/Get_Delays_Ctrl.ctl"/>
			<Item Name="ProcessTTRecMHT2.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/ProcessTTRecMHT2.vi"/>
			<Item Name="Count_Triggers.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_OTF_Subtraction/Count_Triggers.vi"/>
			<Item Name="AnalyzeEvent_Double.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_OTF_Subtraction/AnalyzeEvent_Double.vi"/>
			<Item Name="Count_Coincidences.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/SubVIs/MH_OTF_Subtraction/Count_Coincidences.vi"/>
			<Item Name="MH_DataProcThread_QCmds.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_DataProcThread_QCmds.ctl"/>
			<Item Name="MH_DataProcThread_QData.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_DataProcThread_QData.ctl"/>
			<Item Name="MH_DataProcThread_QRef.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Types/MH_DataProcThread_QRef.ctl"/>
			<Item Name="MH_ActorCluster.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Multiharp/Multiharp/Multiharp/MH_ActorCluster.ctl"/>
			<Item Name="ControllerComm.lvlib" Type="Library" URL="../../ControllerComm.lvlib"/>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="JX_GoHome Msg.lvclass" Type="LVClass" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Jiaxin_Stepper_Controller/Jiaxin_Stepper_Controller Messages/JX_GoHome Msg/JX_GoHome Msg.lvclass"/>
			<Item Name="JX_SetHome Msg.lvclass" Type="LVClass" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/Jiaxin_Stepper_Controller/Jiaxin_Stepper_Controller Messages/JX_SetHome Msg/JX_SetHome Msg.lvclass"/>
			<Item Name="Thorlabs.MotionControl.Controls.dll" Type="Document" URL="../../SinglePhoton_UI/Thorlabs.MotionControl.Controls.dll"/>
			<Item Name="SPIController.lvlib" Type="Library" URL="../../SinglePhoton_UI/Libraries/SPIController/SPIController.lvlib"/>
			<Item Name="SinglePhotonInterferenceUI.lvlib" Type="Library" URL="../../SinglePhoton_UI/Libraries/SinglePhotonInterferenceUI/SinglePhotonInterferenceUI.lvlib"/>
			<Item Name="Mean_stdev_Calculation.vi" Type="VI" URL="../../SinglePhoton_UI/Libraries/SinglePhotonInterferenceUI/SinglePhotonInterferenceUI/Mean_stdev_Calculation.vi"/>
			<Item Name="Calc_Allan-Variance.VI" Type="VI" URL="../../SinglePhoton_UI/Libraries/SinglePhotonInterferenceUI/SinglePhotonInterferenceUI/Calc_Allan-Variance.VI"/>
			<Item Name="MH_SetAllChannels.vi" Type="VI" URL="../../SinglePhoton_UI/Libraries/SinglePhotonInterferenceUI/SinglePhotonInterferenceUI/MH_SetAllChannels.vi"/>
			<Item Name="Thorlabs.MotionControl.KCube.InertialMotorCLI.dll" Type="Document" URL="../../SinglePhoton_UI/Thorlabs.MotionControl.KCube.InertialMotorCLI.dll"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
