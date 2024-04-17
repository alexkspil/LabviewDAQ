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
		<Item Name="Interfaces" Type="Folder">
			<Item Name="Cameras_LV" Type="Folder">
				<Item Name="CameraDAQ" Type="Folder">
					<Item Name="CameraDAQ.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraDAQ/CameraDAQ.lvclass"/>
				</Item>
				<Item Name="CameraDAQ Messages" Type="Folder">
					<Item Name="GrabFrame Msg" Type="Folder">
						<Item Name="GrabFrame Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraDAQ Messages/GrabFrame Msg/GrabFrame Msg.lvclass"/>
					</Item>
				</Item>
				<Item Name="CameraInterface" Type="Folder">
					<Item Name="CameraInterface.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface/CameraInterface.lvclass"/>
				</Item>
			</Item>
			<Item Name="InitDeinitInterface" Type="Folder">
				<Item Name="InitDeinit" Type="Folder">
					<Item Name="InitDeinit.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinit/InitDeinit.lvclass"/>
				</Item>
				<Item Name="InitDeinit Messages" Type="Folder"/>
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
			</Item>
		</Item>
		<Item Name="HamaCam.lvlib" Type="Library" URL="../HamaCam/HamaCam.lvlib"/>
		<Item Name="InstrumentData.ctl" Type="VI" URL="../HamaCam/HamaCam/InstrumentData.ctl"/>
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
			<Item Name="AF Debug.lvlib" Type="Library" URL="/&lt;resource&gt;/AFDebug/AF Debug.lvlib"/>
			<Item Name="instrumentType.ctl" Type="VI" URL="../../../../../UIs/InterferometryUI/InterferometryUI/instrumentType.ctl"/>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
			<Item Name="systemLogging.framework" Type="Document" URL="systemLogging.framework">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="tm_closecamera_40.vi" Type="VI" URL="../HamaVIs/Hamamatsu Video Capture [4423]/tm_closecamera_40.vi"/>
			<Item Name="tm_deinitialize_40.vi" Type="VI" URL="../HamaVIs/Hamamatsu Video Capture [4423]/tm_deinitialize_40.vi"/>
			<Item Name="tm_errorreport.vi" Type="VI" URL="../HamaVIs/Hamamatsu Video Capture [4423]/tm_errorreport.vi"/>
			<Item Name="tm_getframe16_40.vi" Type="VI" URL="../HamaVIs/Hamamatsu Video Capture [4423]/tm_getframe16_40.vi"/>
			<Item Name="tm_getparameterlist_40.vi" Type="VI" URL="../HamaVIs/Hamamatsu Video Capture [4423]/tm_getparameterlist_40.vi"/>
			<Item Name="tm_initialize_40.vi" Type="VI" URL="../HamaVIs/Hamamatsu Video Capture [4423]/tm_initialize_40.vi"/>
			<Item Name="tm_opencamera_40.vi" Type="VI" URL="../HamaVIs/Hamamatsu Video Capture [4423]/tm_opencamera_40.vi"/>
			<Item Name="tm_preparecapture_40.vi" Type="VI" URL="../HamaVIs/Hamamatsu Video Capture [4423]/tm_preparecapture_40.vi"/>
			<Item Name="tm_startcapture_40.vi" Type="VI" URL="../HamaVIs/Hamamatsu Video Capture [4423]/tm_startcapture_40.vi"/>
			<Item Name="tm_stopcapture_40.vi" Type="VI" URL="../HamaVIs/Hamamatsu Video Capture [4423]/tm_stopcapture_40.vi"/>
			<Item Name="tm_unpreparecapture_40.vi" Type="VI" URL="../HamaVIs/Hamamatsu Video Capture [4423]/tm_unpreparecapture_40.vi"/>
			<Item Name="tm_waitnextframe_40.vi" Type="VI" URL="../HamaVIs/Hamamatsu Video Capture [4423]/tm_waitnextframe_40.vi"/>
			<Item Name="tmcamcon.dll" Type="Document" URL="tmcamcon.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
