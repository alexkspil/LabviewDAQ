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
		<Item Name="SpectrumAnalyzerUI.lvlib" Type="Library" URL="../SpectrumAnalyzerUI.lvlib"/>
		<Item Name="KeysightN9020B.lvlib" Type="Library" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/KeysightN9020B/KeysightN9020B.lvlib"/>
		<Item Name="SpectrumAnalyzerInterface.lvlib" Type="Library" URL="../../../Interfaces/AbstractInstrumentClasses/SpectrumAnalyzer_LV/SpectrumAnalyzerInterface/SpectrumAnalyzerInterface.lvlib"/>
		<Item Name="typedefs.lvlib" Type="Library" URL="../../../typedefs/typedefs.lvlib"/>
		<Item Name="InitDeInit.lvlib" Type="Library" URL="../../../Interfaces/InitDeinitInterface/InitDeInit.lvlib"/>
		<Item Name="Keysight XSAn.lvlib" Type="Library" URL="/&lt;instrlib&gt;/Keysight XSAn/Keysight XSAn.lvlib"/>
		<Item Name="SpectrumAnalyzerData.ctl" Type="VI" URL="../../../typedefs/SpectrumAnalyzerData.ctl"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Actor Framework.lvlib" Type="Library" URL="/&lt;vilib&gt;/ActorFramework/Actor Framework.lvlib"/>
				<Item Name="Casting Utility For Actors.vim" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Actor/Casting Utility For Actors.vim"/>
				<Item Name="Error Cluster From Error Code.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Cluster From Error Code.vi"/>
				<Item Name="Get LV Class Name.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/LVClass/Get LV Class Name.vi"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="IMAQ Image.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Image.ctl"/>
				<Item Name="NI_SystemLogging.lvlib" Type="Library" URL="/&lt;vilib&gt;/Utility/SystemLogging/NI_SystemLogging.lvlib"/>
				<Item Name="Time-Delay Override Options.ctl" Type="VI" URL="/&lt;vilib&gt;/ActorFramework/Time-Delayed Send Message/Time-Delay Override Options.ctl"/>
			</Item>
			<Item Name="AF Debug.lvlib" Type="Library" URL="/&lt;resource&gt;/AFDebug/AF Debug.lvlib"/>
			<Item Name="AgXSAn_64.dll" Type="Document" URL="AgXSAn_64.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Get_SA_Spectrum_SubVI.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/KeysightN9020B/Get_SA_Spectrum_SubVI.vi"/>
			<Item Name="LV Config Read String.vi" Type="VI" URL="/&lt;resource&gt;/dialog/lvconfig.llb/LV Config Read String.vi"/>
			<Item Name="systemLogging.dll" Type="Document" URL="systemLogging.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="Thorlabs.MotionControl.KCube.InertialMotorCLI.dll" Type="Document" URL="../../TranslationStage_UI/Thorlabs.MotionControl.KCube.InertialMotorCLI.dll"/>
			<Item Name="TranslationStageType.ctl" Type="VI" URL="../../../typedefs/TranslationStageType.ctl"/>
			<Item Name="Init_SubVI.vi" Type="VI" URL="../../../ConcreteClasses/ConcreteInstrumentClasses/KeysightN9020B/Init_SubVI.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
