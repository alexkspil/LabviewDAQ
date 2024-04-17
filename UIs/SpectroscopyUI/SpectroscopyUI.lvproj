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
		<Item Name="Interfaces" Type="Folder">
			<Item Name="AbstractInstrumentClasses" Type="Folder">
				<Item Name="Spectrometers_LV" Type="Folder">
					<Item Name="Spectrometer Messages" Type="Folder">
						<Item Name="SetMirror Msg" Type="Folder"/>
					</Item>
					<Item Name="SpectrometerComm" Type="Folder">
						<Item Name="SpectrometerComm.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm/SpectrometerComm.lvclass"/>
					</Item>
					<Item Name="SpectrometerComm Messages" Type="Folder">
						<Item Name="GratingChanged Msg" Type="Folder">
							<Item Name="GratingChanged Msg.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm Messages/GratingChanged Msg/GratingChanged Msg.lvclass"/>
						</Item>
						<Item Name="MirrorMoved Msg" Type="Folder">
							<Item Name="MirrorMoved Msg.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm Messages/MirrorMoved Msg/MirrorMoved Msg.lvclass"/>
						</Item>
						<Item Name="SendParameters Msg" Type="Folder">
							<Item Name="ParametersUpdated Msg.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm Messages/SendParameters Msg/ParametersUpdated Msg.lvclass"/>
						</Item>
						<Item Name="SlitMoved Msg" Type="Folder">
							<Item Name="SlitMoved Msg.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm Messages/SlitMoved Msg/SlitMoved Msg.lvclass"/>
						</Item>
						<Item Name="WavelengthSet Msg" Type="Folder">
							<Item Name="WavelengthSet Msg.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerComm Messages/WavelengthSet Msg/WavelengthSet Msg.lvclass"/>
						</Item>
					</Item>
					<Item Name="SpectrometerInterface" Type="Folder">
						<Item Name="Spectrometer.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Spectrometers_LV/SpectrometerInterface/Spectrometer.lvclass"/>
					</Item>
				</Item>
				<Item Name="Cameras" Type="Folder">
					<Item Name="CameraDAQ" Type="Folder">
						<Item Name="CameraDAQ.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraDAQ/CameraDAQ.lvclass"/>
					</Item>
					<Item Name="CameraDAQ Messages" Type="Folder">
						<Item Name="GrabFrame Msg" Type="Folder">
							<Item Name="GrabFrame Msg.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraDAQ Messages/GrabFrame Msg/GrabFrame Msg.lvclass"/>
						</Item>
					</Item>
					<Item Name="CameraInterface" Type="Folder">
						<Item Name="CameraInterface.lvclass" Type="LVClass" URL="../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface/CameraInterface.lvclass"/>
					</Item>
				</Item>
			</Item>
			<Item Name="InitDeInitInterface" Type="Folder">
				<Item Name="InitDeinit" Type="Folder">
					<Item Name="InitDeinit.lvclass" Type="LVClass" URL="../../../Interfaces/InitDeinitInterface/InitDeinit/InitDeinit.lvclass"/>
				</Item>
				<Item Name="InitDeinit Messages" Type="Folder"/>
				<Item Name="InitDeinitComm" Type="Folder">
					<Item Name="InitDeinitComm.lvclass" Type="LVClass" URL="../../../Interfaces/InitDeinitInterface/InitDeinitComm/InitDeinitComm.lvclass"/>
				</Item>
				<Item Name="InitDeinitComm Messages" Type="Folder">
					<Item Name="InitDone Msg.lvclass" Type="LVClass" URL="../../../Interfaces/InitDeinitInterface/InitDeinitComm Messages/InitDone Msg/InitDone Msg.lvclass"/>
					<Item Name="FoundInstruments Msg.lvclass" Type="LVClass" URL="../../../Interfaces/InitDeinitInterface/InitDeinitComm Messages/FoundInstruments Msg/FoundInstruments Msg.lvclass"/>
				</Item>
			</Item>
		</Item>
		<Item Name="ConcreteInstrumentClasses" Type="Folder">
			<Item Name="HRS_Spectrometer.lvlib" Type="Library" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/SpectrometerClasses/Spectrometer_HRS_LV/HRS_Spectrometer/HRS_Spectrometer.lvlib"/>
		</Item>
		<Item Name="UI" Type="Folder">
			<Item Name="SpectroscopyUI" Type="Folder">
				<Item Name="SpectroscopyUI.lvlib" Type="Library" URL="../SpectroscopyUI.lvlib"/>
			</Item>
			<Item Name="SpectrometerUI Messages" Type="Folder"/>
		</Item>
		<Item Name="Launcher.vi" Type="VI" URL="../SpectroscopyUI/Launcher.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Actor Framework.lvlib" Type="Library" URL="/&lt;vilib&gt;/ActorFramework/Actor Framework.lvlib"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Casting Utility For Actors.vim" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Actor/Casting Utility For Actors.vim"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="NI_SystemLogging.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/SystemLogging/NI_SystemLogging.lvlib"/>
				<Item Name="Time-Delay Override Options.ctl" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delay Override Options.ctl"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="Select Event Type.ctl" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/Select Event Type.ctl"/>
			</Item>
			<Item Name="instrumentType.ctl" Type="VI" URL="../../InterferometryUI/InterferometryUI/instrumentType.ctl"/>
			<Item Name="AF Debug.lvlib" Type="Library" URL="/&lt;resource&gt;/AFDebug/AF Debug.lvlib"/>
			<Item Name="systemLogging.framework" Type="Document" URL="systemLogging.framework">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
			<Item Name="InstrumentData.ctl" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/CameraClasses/Hama_LV/HamaCam/HamaCam/InstrumentData.ctl"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
