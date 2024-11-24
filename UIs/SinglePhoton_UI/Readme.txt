Objective:
Create a Labview GUI that can perform single-photon interference measurements.

Instruments used:
- Multiharp 150
- Thorlabs KIM101 + Piezo Inertia Actuator  (Phase 1)
- Jiaxin SM controller + XYZ translation stage

First Phase

In the first phase, the already developed single photon coincidence GUI should be modified so that it offers a simple means of:- 
- Adjusting the instrument and measurement parameters
- Showing single counts and coincidence counts in real time
- Acquiring raw photon detection data from the Multiharp for a certain amount of time
- Moving the piezo actuator by a certain amount of steps, provided by the user
- Combining the two actions to perform a scan. When one action is finished, the other should start
- (Optional) Analyse the data in real time

The sets of raw data obtained can be analyzed post-acquisition, or in real time, with the help of an analysis thread. The resulting data
in both cases should show the single-photon interferogram, and from that, we should obtain the values for:
- The photon wavelength
- The wavepacket coherence length
- The maximum visibility

The alignment will be performed using a thorlabs camera. At this time, integration of the camera to the program will not be needed. In 
the future, the addition of the camera to the GUI should be considered, as well as a choice between this camera and the Inovance CMOS,
which is equally compact and much easier to integrate on Labview.


Second phase 

For the second phase, an extra functionality should be added, to control a three-axis translation stage in a manner that 
a raster scan can be performed. The 2 axes will be scanned to create the raster image, and the third (Z) axis will be used to bring the
pixel (herein a single-mode fiber) to the imaging plane. Control of the XYZ stage will be performed through the Jiaxin Stepper Motor 
controller.
The analysis of the data should produce a 2D image, consisting of the coincidence count after a set amount of triggers on every pixel.

GUI Buttons and Parameter Boxes

KIM 101
- Parameters
	- Jog parameters
		- Speed
		- Acceleration
		- Jog Mode (Step/Continuous)
		- Jog Steps
	Note: The first three can initially be set as constants. 
	- GoTo value
- Buttons
	- Jog Button
	- GoTo Button
	- Reset Button

Multiharp
- Parameters
	- Multiharp Sync and Input channels parameters (cluster)
	- Acquisition Time
	
- Buttons
	- Run/Stop
	- Reset

Scan

- Parameters
	- Steps per segment
	- Segments
	- Number of triggers per segment
	- Acquire Raw/Real Time 	
- Buttons
	- Scan
	- Stop Scan
	

Strategy

The program should follow the actor framework architecture. An actor should be created for each instrument. The two motion controllers
will inherit by a common interface for motion controllers. A tentative version of this interface has been developed, and applied on
an arduino-controlled stepper motor translation stage.

The first step should be to create an actor for the KIM101 controller. Once this is working, we should move to developing the Multiharp
actor. When these two actors are ready, the scan functionality should be developed. Using this, we will get raw data, and analyze them
offline. Then, the XYZ translation stage actor will be written. Then, we can get raw data using the SLM. 
At a later time, a real-time data acquisition functionality can be developed.

Actor Architecture

Root Actor: 
- Controller
 
Nested Actors:
- UI 
- KIM101
- Multiharp
- Data processing thread

	  Controller
	 /|\		\
	/ | \  	 \
     /  |  \  	  \
    /   |   \  	   \
   /    |    \  	    \
  /     |     \        \
UI  Multiharp KIM101	DP


Controller:
- Launches and kills the four nested actors
- Receives messages by the UI, and sends them to the Multiharp and KIM
- Receives "Done" Messages from MH, KIM, and DP, and sends them to the UI if necessary(Enable/Disable Buttons)
- Receives buffer data from the Multiharp, and sends them to DP
- Receives processed data from DP, and sends them to the UI 
- Handles the scans

Multiharp functions:
- Init. Should be done after the UI initializes, better by an "Init" Button. Should include setting the channels, sequentially. The UI 
thread cluster should be sent to init as is.

- SetInputChannels
- SetSyncDivider
- SetSyncTrigger
- SetSyncDeadTime
- SetSyncOffset
- SetBinning (Not on T2)
- SetHistoOffset (Not on T2)
- SetHistoLen (Not on T2)
- SetStopOverflow

- GetAllRates OR GetRates
- Start Measurement (includes read FIFO)
- AbortMeasurement
- GetResolution (Not on T2)
- GetHistos OR GetAllHistos (Not on T2, I guess)

The Set functions can be put under the same function, "SetParameter"

Rates and Histograms

When the Multiharp actor is launched, it will, by default send the single count rates to the UI, by messaging the data to the UI. It will
also check whether the histograms are requested, and if they are, it will send them, too. The time between two data dumps will be
determined in the UI. Both histograms and count rates envoy will be turned off when the MH is measuring through the buffer.


UI Elements - Block Diagram

The Multiharp and KIM101 event structure cases will be used as they are. User events will be added to herald the end of instrument
processes (e.g. init done) and the existence of data on the queue. Below is a list of the events needed on the event structure. 


Events
	- Timeout

Buttons
	- Panel Close?
	- Exit

	Multiharp
	- Init Multiharp
	- Start Histogram
	- Start Measurement
	- Change Mode
	- Channel Cluster Parameter
	- AllChannels
	- Sync Divider/Offset/Trigger/Level/Dead Time
	- Binning
	- HistoOffset
	- AcqTime
	- SetOvlLevel
	- HistoLength
	- Histograms On

	KIM
	- Init KIM
	- Jog
	- Reset KIM


User Events
	- stop

	Multiharp
	- Multiharp Init Done
	- Multiharp Channel Init Done
	- Multiharp Measurement Done	
	- MH data ready (Histogram/Rates)
	- Multiharp Parameter Set

	KIM
	- KIM Init Done
	- KIM moved




Messages 

UI to Multiharp
	- MH Init
		Inputs: Mode
	- Set Input Channels
		Inputs: SetInpChan, features, Channels
	- Set SyncTrig
		Inputs: SyncEdge,SyncLevel
	- Set DeadTime
		Inputs: On, deadtime
	- Set Binning
		Inputs: Binning
	- Start Measurement
		
	- Start Histograms
	- Set Histo
	- DeInit
				

Multiharp to UI
	- Init Done
		Inputs: instrument data, devidx, init info
	- Channel Init Done
		Inputs:None
	- Channels Set
		Inputs: None
	- Sync Set
		Inputs:None

Interfaces

In this architecture, the nested actors should communicate with each other. While this is not the recommended procedure, NI engineers
explicitly admit that it is standard practice in such cases. The process is as follows:

1) The controller launches the instruments
2) The instruments message their enqueuer to the controller
3) The controller sends the instrument enqueuers to the UI
4) The UI sends messages directly to the instruments


Controller User Events:

- UI Launched
- Multiharp Launched
- KIM launched
- Data Processor Launched



