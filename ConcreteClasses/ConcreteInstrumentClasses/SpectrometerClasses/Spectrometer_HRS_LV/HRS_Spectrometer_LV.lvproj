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
			<Item Name="InitDeinit.lvclass" Type="LVClass" URL="../../InitDeinitInterface/InitDeinit/InitDeinit.lvclass"/>
		</Item>
		<Item Name="InitDeinit Messages" Type="Folder"/>
		<Item Name="InitDeinitComm" Type="Folder">
			<Item Name="InitDeinitComm.lvclass" Type="LVClass" URL="../../InitDeinitInterface/InitDeinitComm/InitDeinitComm.lvclass"/>
		</Item>
		<Item Name="InitDeinitComm Messages" Type="Folder">
			<Item Name="InitDone Msg" Type="Folder">
				<Item Name="InitDone Msg.lvclass" Type="LVClass" URL="../../InitDeinitInterface/InitDeinitComm Messages/InitDone Msg/InitDone Msg.lvclass"/>
			</Item>
		</Item>
		<Item Name="SpectrometerInterfaces" Type="Folder">
			<Item Name="SpectrometerComm" Type="Folder">
				<Item Name="SpectrometerComm.lvclass" Type="LVClass" URL="../SpectrometerComm/SpectrometerComm.lvclass"/>
			</Item>
			<Item Name="SpectrometerComm Messages" Type="Folder">
				<Item Name="GratingChanged Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm Messages/GratingChanged Msg/GratingChanged Msg.lvclass"/>
				<Item Name="MirrorMoved Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm Messages/MirrorMoved Msg/MirrorMoved Msg.lvclass"/>
				<Item Name="ParametersUpdated Msg.lvclass" Type="LVClass" URL="../SpectrometerComm Messages/SendParameters Msg/ParametersUpdated Msg.lvclass"/>
				<Item Name="SlitMoved Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm Messages/SlitMoved Msg/SlitMoved Msg.lvclass"/>
				<Item Name="WavelengthSet Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm Messages/WavelengthSet Msg/WavelengthSet Msg.lvclass"/>
			</Item>
			<Item Name="SpectrometerInterface" Type="Folder">
				<Item Name="Spectrometer.lvclass" Type="LVClass" URL="../Spectrometer.lvclass"/>
			</Item>
		</Item>
		<Item Name="HRS_Spectrometer.lvlib" Type="Library" URL="../HRS_Spectrometer/HRS_Spectrometer.lvlib"/>
		<Item Name="SpectrometerUI.lvlib" Type="Library" URL="../../../../../UIs/SpectrometerUI/SpectrometerUI.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Actor Framework.lvlib" Type="Library" URL="/&lt;vilib&gt;/ActorFramework/Actor Framework.lvlib"/>
				<Item Name="Casting Utility For Actors.vim" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Actor/Casting Utility For Actors.vim"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="IMAQ Image.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Image.ctl"/>
				<Item Name="NI_SystemLogging.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/SystemLogging/NI_SystemLogging.lvlib"/>
				<Item Name="Select Event Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/Select Event Type.ctl"/>
				<Item Name="Time-Delay Override Options.ctl" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delay Override Options.ctl"/>
			</Item>
			<Item Name="AF Debug.lvlib" Type="Library" URL="/&lt;resource&gt;/AFDebug/AF Debug.lvlib"/>
			<Item Name="InitDeInit.lvlib" Type="Library" URL="../../../../../Interfaces/InitDeinitInterface/InitDeInit.lvlib"/>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
			<Item Name="ParametersUpdated Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm Messages/SendParameters Msg/ParametersUpdated Msg.lvclass"/>
			<Item Name="Spectrometer.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerInterface/Spectrometer.lvclass"/>
			<Item Name="SpectrometerComm.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm/SpectrometerComm.lvclass"/>
			<Item Name="SpectroMirrorCtrl.ctl" Type="VI" URL="../../../../../UIs/SinglePhoton_UI/typedefs/SpectroMirrorCtrl.ctl"/>
			<Item Name="SpectroMirrorCtrl.ctl" Type="VI" URL="../../../../../UIs/SpectroscopyUI/SpectroscopyUI/SpectroMirrorCtrl.ctl"/>
			<Item Name="SpectrSlitControl.ctl" Type="VI" URL="../../../../../UIs/SinglePhoton_UI/typedefs/SpectrSlitControl.ctl"/>
			<Item Name="SpectrSlitControl.ctl" Type="VI" URL="../../../../../UIs/SpectroscopyUI/SpectroscopyUI/SpectrSlitControl.ctl"/>
			<Item Name="systemLogging.dll" Type="Document" URL="systemLogging.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Thorlabs.MotionControl.KCube.InertialMotorCLI.dll" Type="Document" URL="../../../KIM101/KIM_dll/Thorlabs.MotionControl.KCube.InertialMotorCLI.dll"/>
			<Item Name="typedefs.lvlib" Type="Library" URL="../../../../../typedefs/typedefs.lvlib"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
