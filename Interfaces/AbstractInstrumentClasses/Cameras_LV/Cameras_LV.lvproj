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
		<Item Name="CameraInterface" Type="Folder">
			<Item Name="CameraDAQ.lvclass" Type="LVClass" URL="../CameraDAQ/CameraDAQ.lvclass"/>
			<Item Name="GrabFrame Msg.lvclass" Type="LVClass" URL="../CameraDAQ Messages/GrabFrame Msg/GrabFrame Msg.lvclass"/>
			<Item Name="ImagingDevice.lvclass" Type="LVClass" URL="../ImagingDevice/ImagingDevice.lvclass"/>
		</Item>
		<Item Name="InitDeinit" Type="Folder">
			<Item Name="InitDeinit.lvclass" Type="LVClass" URL="../InitDeinit/InitDeinit.lvclass"/>
			<Item Name="InitDeinitComm.lvclass" Type="LVClass" URL="../InitDeinitComm/InitDeinitComm.lvclass"/>
			<Item Name="InitDone Msg.lvclass" Type="LVClass" URL="../InitDeinitComm Messages/InitDone Msg/InitDone Msg.lvclass"/>
		</Item>
		<Item Name="ZWO_ASI.lvlib" Type="Library" URL="../ZWO_ASI/ZWO_ASI.lvlib"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="user.lib" Type="Folder">
				<Item Name="ASICamera2_no_err.lvlib" Type="Library" URL="/&lt;userlib&gt;/ASICamera2_no_err/ASICamera2_no_err.lvlib"/>
			</Item>
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Actor Framework.lvlib" Type="Library" URL="/&lt;vilib&gt;/ActorFramework/Actor Framework.lvlib"/>
				<Item Name="Casting Utility For Actors.vim" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Actor/Casting Utility For Actors.vim"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="NI_SystemLogging.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/SystemLogging/NI_SystemLogging.lvlib"/>
				<Item Name="RGB to Color.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/RGB to Color.vi"/>
				<Item Name="Time-Delay Override Options.ctl" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delay Override Options.ctl"/>
			</Item>
			<Item Name="AF Debug.lvlib" Type="Library" URL="/&lt;resource&gt;/AFDebug/AF Debug.lvlib"/>
			<Item Name="ASI_bufferToImage_Array.vi" Type="VI" URL="../ZWO_ASI/ASI_bufferToImage_Array.vi"/>
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
