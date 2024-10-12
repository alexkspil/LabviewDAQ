<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="23008000">
	<Property Name="NI.LV.All.SourceOnly" Type="Bool">true</Property>
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="InitDeinit" Type="Folder">
			<Item Name="InitDeinit.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinit/InitDeinit.lvclass"/>
		</Item>
		<Item Name="InitDeinit Messages" Type="Folder">
			<Item Name="DeInit Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinit Messages/DeInit Msg/DeInit Msg.lvclass"/>
			<Item Name="Disconnect Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinit Messages/Disconnect Msg/Disconnect Msg.lvclass"/>
			<Item Name="FindInstruments Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinit Messages/FindInstruments Msg/FindInstruments Msg.lvclass"/>
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
			<Item Name="FoundInstruments Msg" Type="Folder">
				<Item Name="FoundInstruments Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinitComm Messages/FoundInstruments Msg/FoundInstruments Msg.lvclass"/>
			</Item>
			<Item Name="InitDone Msg" Type="Folder">
				<Item Name="InitDone Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinitComm Messages/InitDone Msg/InitDone Msg.lvclass"/>
			</Item>
		</Item>
		<Item Name="TranslationStages" Type="Folder">
			<Item Name="TranslationStages.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStages/TranslationStages.lvclass"/>
		</Item>
		<Item Name="TranslationStages Messages" Type="Folder">
			<Item Name="Goto Msg" Type="Folder">
				<Item Name="Goto Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStages Messages/Goto Msg/Goto Msg.lvclass"/>
			</Item>
			<Item Name="MoveBySteps Msg" Type="Folder">
				<Item Name="MoveBySteps Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStages Messages/MoveBySteps Msg/MoveBySteps Msg.lvclass"/>
			</Item>
		</Item>
		<Item Name="TranslationStagesComm" Type="Folder">
			<Item Name="TranslationStagesComm.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStagesComm/TranslationStagesComm.lvclass"/>
		</Item>
		<Item Name="TranslationStagesComm Messages" Type="Folder">
			<Item Name="LimitReached Msg" Type="Folder">
				<Item Name="LimitReached Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStagesComm Messages/LimitReached Msg/LimitReached Msg.lvclass"/>
			</Item>
			<Item Name="StageMoveDone Msg" Type="Folder">
				<Item Name="StageMoveDone Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/TranslationStages_LV/TranslationStagesComm Messages/StageMoveDone Msg/StageMoveDone Msg.lvclass"/>
			</Item>
		</Item>
		<Item Name="KIM101.lvlib" Type="Library" URL="../../KIM101.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Actor Framework.lvlib" Type="Library" URL="/&lt;vilib&gt;/ActorFramework/Actor Framework.lvlib"/>
				<Item Name="Casting Utility For Actors.vim" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Actor/Casting Utility For Actors.vim"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="NI_SystemLogging.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/SystemLogging/NI_SystemLogging.lvlib"/>
				<Item Name="Time-Delay Override Options.ctl" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delay Override Options.ctl"/>
			</Item>
			<Item Name="AddressType.ctl" Type="VI" URL="../../../../../typedefs/AddressType.ctl"/>
			<Item Name="AF Debug.lvlib" Type="Library" URL="/&lt;resource&gt;/AFDebug/AF Debug.lvlib"/>
			<Item Name="InstrumentData.ctl" Type="VI" URL="../../../../../UIs/SpectroscopyUI/InstrumentData.ctl"/>
			<Item Name="instrumentType.ctl" Type="VI" URL="../../../../../UIs/InterferometryUI/InterferometryUI/instrumentType.ctl"/>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
			<Item Name="SetJogParameters.vi" Type="VI" URL="../SetJogParameters.vi"/>
			<Item Name="systemLogging.framework" Type="Document" URL="systemLogging.framework">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Thorlabs.MotionControl.KCube.InertialMotorCLI.dll" Type="Document" URL="/W/Quant_Opt_Group/Group/Alex/Single-Photon Correlations Software/KIM101_FSM/Thorlabs.MotionControl.KCube.InertialMotorCLI.dll"/>
			<Item Name="typedefs.lvlib" Type="Library" URL="../../../../../typedefs/typedefs.lvlib"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
