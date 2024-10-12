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
			<Item Name="FindInstruments Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinit Messages/FindInstruments Msg/FindInstruments Msg.lvclass"/>
			<Item Name="Init Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinit Messages/Init Msg/Init Msg.lvclass"/>
		</Item>
		<Item Name="InitDeinitComm" Type="Folder">
			<Item Name="InitDeinitComm.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinitComm/InitDeinitComm.lvclass"/>
		</Item>
		<Item Name="InitDeinitComm Messages" Type="Folder">
			<Item Name="FoundInstruments Msg" Type="Folder">
				<Item Name="FoundInstruments Msg.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinitComm Messages/FoundInstruments Msg/FoundInstruments Msg.lvclass"/>
			</Item>
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
		<Item Name="InitDeinit.lvclass" Type="LVClass" URL="../../../../../Interfaces/InitDeinitInterface/InitDeinit/InitDeinit.lvclass"/>
		<Item Name="CameraInterface.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraInterface/CameraInterface.lvclass"/>
		<Item Name="CameraOptionsInterface.lvclass" Type="LVClass" URL="../../../../../Interfaces/AbstractInstrumentClasses/Cameras_LV/CameraOptionsInterface/CameraOptionsInterface.lvclass"/>
		<Item Name="Inovance_Camera.lvlib" Type="Library" URL="../Inovance_Camera/Inovance_Camera.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Actor Framework.lvlib" Type="Library" URL="/&lt;vilib&gt;/ActorFramework/Actor Framework.lvlib"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="NI_SystemLogging.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/SystemLogging/NI_SystemLogging.lvlib"/>
				<Item Name="Time-Delay Override Options.ctl" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delay Override Options.ctl"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="Casting Utility For Actors.vim" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Actor/Casting Utility For Actors.vim"/>
			</Item>
			<Item Name="typedefs.lvlib" Type="Library" URL="../../../../../typedefs/typedefs.lvlib"/>
			<Item Name="AF Debug.lvlib" Type="Library" URL="/&lt;resource&gt;/AFDebug/AF Debug.lvlib"/>
			<Item Name="AddressType.ctl" Type="VI" URL="../../../../../typedefs/AddressType.ctl"/>
			<Item Name="systemLogging.framework" Type="Document" URL="systemLogging.framework">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
