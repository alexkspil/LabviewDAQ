# todo: bin_size in ui should be a dropdown menu of only 1, 2, 4
# todo: try take out timer entirely


from hamamatsu_orca_sdk import HamamatsuCameraMR, InitCam
from abc import ABCMeta
import numpy as np
import time
# from PyQt5 import QtCore
from cam__base import Camera_Base


class BaseHamamatsu(Camera_Base):
    """Base class for Hamamatsu cameras, tested with orca flash4.0v3"""
    __metaclass__ = ABCMeta

    def __init__(self,
                 cam_number : int,
                 exposure_time_ms: float,
                 trig_mode: int | None = 1,
                 temper: bool | None = False,
                 parent=None) -> None:
        # super(CameraThread, self).__init__(parent) # pan
        # super(Camera_Base, self).__init__(parent)

        self.trigg_mode = trig_mode
        self.cam_no = cam_number
        self.bin_sz = 1
        self.delay_ms = 49.5/1000.0
        "~~~~~~~"
        " here is where the initialisation happens"
        "~~~~~~~"
        print("initializing camera")
        InitCam() # pan change
        self.hcam = HamamatsuCameraMR(camera_numb=self.cam_no) # pan chane=ge
        # set exposure
        self.exposure = exposure_time_ms
        # init variables and properties
        self.sensor_temp = 10 # pan it was 42, do I need that?
        # self.timer = QtCore.QTimer() pan comments all this
        # self.timer.timeout.connect(self.sensor_temp_is)  # this is the timer signaling for temperature update
        # if temper:
        #     self.timer.start(1000)  # it is set to 1sec
        # else:
        #     print("temp readout off")

        self.hcam.getPropertyValue("trigger_mode")
        self.hcam.getPropertyValue("trigger_source")
        self.hcam.getPropertyValue("sensor_cooler_status")
        self.hcam.getPropertyValue("sensor_temperature")

        [self.cam_x, _] = self.hcam.getPropertyValue("image_detector_pixel_num_horz")
        [self.cam_y, _] = self.hcam.getPropertyValue("image_detector_pixel_num_vert")

        self.hcam.setPropertyValue("defect_correct_mode", "OFF")
        self.hcam.setPropertyValue("subarray_hsize", self.cam_x)
        self.hcam.setPropertyValue("subarray_vsize", self.cam_y)
        # self.hcam.setPropertyValue("subarray_mode", "ON")
        self.hcam.setPropertyValue("binning", "{}x{}".format(self.bin_sz, self.bin_sz))
        self.hcam.setPropertyValue("readout_speed", 2)  # slow readout mode is 2, 30fps max
        # set/get roi mode
        self.hcam.setPropertyValue("sensor_mode", 2)
        self.hcam.getPropertyValue("sensor_mode")
        self.hcam.getPropertyValue("subarray_mode")
        self.hcam.getPropertyValue("binning")
        self.hcam.getPropertyValue("readout_speed")

        self.roi_is = [0, 0, 4096, 2304]  # FIXME: fixmeeeeeeeeee #the camera specs
        self.img_sz_y = int(np.floor(self.cam_y / self.bin_sz))
        self.img_sz_x = int(np.floor(self.cam_x / self.bin_sz))
        self.last_frame = np.zeros((self.img_sz_y, self.img_sz_x))

    # todo: mk property/Up-setter
    def bin_value(self, new_bin):
        # fixme raises exception in Preview if in live mode and restart
        self.hcam.stopAcquisition()
        self.bin_sz = new_bin
        self.hcam.setPropertyValue("binning", "{}x{}".format(self.bin_sz, self.bin_sz))
        self.img_sz_y = int(np.floor(self.cam_y / self.bin_sz))
        self.img_sz_x = int(np.floor(self.cam_x / self.bin_sz))
        self.hcam.getPropertyValue("binning")


        print('get')
        print(self.hcam.getPropertyValue("subarray_hpos"))
        print(self.hcam.getPropertyValue("subarray_vpos"))
        print(self.hcam.getPropertyValue("subarray_hsize"))
        print(self.hcam.getPropertyValue("subarray_vsize"))




    def sensor_temp_is(self):
        # print("gettin temp")
        # self.tmp.emit(self.hcam.getPropertyValue("sensor_temperature")) # pan
        print("Sensor Temperature is: ",self.hcam.getPropertyValue("sensor_temperature"))

    def roi_current(self):
        # FIXME: currently not used
        """returns,,, current roi"""
        hpos = self.hcam.getPropertyValue("subarray_hpos")
        vpos = self.hcam.getPropertyValue("subarray_vpos")
        hsize = self.hcam.getPropertyValue("subarray_hsize")
        vsize = self.hcam.getPropertyValue("subarray_vsize")
        self.roi_is = [hpos, vpos, hsize, vsize]

    def set_roi(self, hpos, vpos, hsize, vsize): # pan change name from "roi_set_roi" to just "set_roi"
        """sets roi from rectangle,
            pathetically, regions must be dividends of 4"""
        "if you choose to reinstate the -fliplr- condition in acquisition "
        "you will need to reconfigure the hpos value, think it should be like abs(2048-hpos)"
        "manual: in sub-array readout, binning configuration is enabled."

        hpos = hpos   # * self.bin_sz
        vpos = vpos   #  * self.bin_sz
        hsize = hsize   #  * self.bin_sz
        vsize = vsize   #  * self.bin_sz
        print("roi in: hpos, vpos, hsize, vsize: {}, {}, {}, {}".format(hpos, vpos, hsize, vsize))

        self.hcam.stopAcquisition()

        # if self.roi_is[0] != 0 or self.roi_is[1] != 0: # pan comment, this adds every roi to the previous one, I prefer to initialize every time
        #     hpos_the = hpos + self.roi_is[0]
        #     vpos_the = vpos + self.roi_is[1]
        # else:
        #     hpos_the = hpos
        #     vpos_the = vpos
        hpos_the = hpos
        vpos_the = vpos

        if hsize % 4 != 0:
            hsize = hsize - (hsize % 4) + 4
        if hpos_the % 4 != 0:
            hpos_the = hpos_the - (hpos_the % 4) + 4
        if vsize % 4 != 0:
            vsize = vsize - (vsize % 4) + 4
        if vpos_the % 4 != 0:
            vpos_the = vpos_the - (vpos_the % 4) + 4

        self.hcam.setPropertyValue("subarray_hpos", hpos_the)
        self.hcam.setPropertyValue("subarray_vpos", vpos_the)
        self.hcam.setPropertyValue("subarray_hsize", hsize)
        self.hcam.setPropertyValue("subarray_vsize", vsize)

        # set the current values to self
        self.roi_is = [hpos_the, vpos_the, hsize, vsize]
        # read from cam
        new_hpos_the = self.hcam.getPropertyValue("subarray_hpos")
        new_vpos_the = self.hcam.getPropertyValue("subarray_vpos")
        new_hsize = self.hcam.getPropertyValue("subarray_hsize")
        new_vsize = self.hcam.getPropertyValue("subarray_vsize")
        print("new roi: hpos, vpos, hsize, vsize: {}, {}, {}, {}".format(new_hpos_the, new_vpos_the,
                                                                         new_hsize, new_vsize))
        self.img_sz_x = int(self.hcam.getPropertyValue("subarray_hsize")[0] / self.bin_sz)
        self.img_sz_y = int(self.hcam.getPropertyValue("subarray_vsize")[0] / self.bin_sz)

    def clear_roi(self):
        """sets roi to full size"""
        # print('cealr CALL')
        self.roi_is = [0, 0, 4096, 2304]
        self.set_roi(0, 0, 4096, 2304)

    @property
    def trigger_delay(self):
        self.delay_ms = self.hcam.getPropertyValue("trigger_delay")
        print("trigger delay is {} s".format(self.delay_ms))
        return self.delay_ms

    @trigger_delay.setter
    def trigger_delay(self, delay):
        # self.trigg_delay(delay)
        self.hcam.setPropertyValue("trigger_delay", delay)
        self.delay_ms = delay
        print("trigger delay set to {} s".format(delay))

    @property
    def trigger_mode(self):
        self.trigg_mode = self.hcam.getPropertyValue("trigger_source")
        return self.trigg_mode

    @trigger_mode.setter
    def trigger_mode(self, trig_md):

        self.hcam.setPropertyValue("trigger_source", trig_md)
        if trig_md == 2:
            self.hcam.setPropertyValue("trigger_polarity", 1)  # 1 is 'negative'
            self.hcam.setPropertyValue("trigger_delay", 0)  # init delay not
            self.hcam.setPropertyValue("trigger_active", 1)  # 1 is 'edge'
            self.hcam.setPropertyValue("trigger_times", 1)
        self.trigg_mode = trig_md

    @property
    def exposure(self):
        e = self.hcam.getPropertyValue("exposure_time")
        # print("exposure is {}".format(e))
        return e

    @exposure.setter
    def exposure(self, e):
        print("set exposure to {}".format(e))
        self.hcam.setPropertyValue("exposure_time", e)

    def get_grey_values(self):
        """
        :rtype: np.ndarray
        :return: 1D numpy array of grey values
        """

        [frame, dim] = self.hcam.getFrames()
        grey_values = frame[0].getData()
        # del frame
        # gc.collect()
        return grey_values

    def get_all_frames(self):
        """
        :rtype: np.ndarray
        :return: all captured frames
        """

        [frames, dim] = self.hcam.getFrames()
        # print("frame dim is: {}".format(dim))
        # print(frames)
        return frames

    def get_grey_values_o_frames(self, all_frames, frame_no):
        """
        :rtype: np.ndarray
        :return: 1D numpy array of grey values
        """

        # print("frame no is: {}".format(frame_no))
        grey_values = all_frames[frame_no].getData()
        return grey_values

    def end(self):
        self.hcam.stopAcquisition()

    def terminate(self) -> None:
        super().terminate()

    def run(self):
        pass

    def take_image(self) -> np.ndarray:
        pass

    def take_average_image(self, num: int):
        pass

    def rec_mode(self):
        pass

    def show_image(self, lognorm=False) -> None:
        pass

    def center_to_max(self, shape: tuple[int, int]) -> None:
        pass


class CaptureHamamatsu(BaseHamamatsu):
    # """ it's a thread (inherits from Camera). it runs and it emits""" # pan
    def __init__(self, cam_number: int, exposure_time_ms: float, trig_mode: int | None = 1, parent=None) -> None:
        super(CaptureHamamatsu, self).__init__(cam_number, exposure_time_ms, trig_mode, parent)
        self._show_preview = True
        self.num = 1
        self.hcam.setACQMode('fixed_length', number_frames=self.num)
        self.mode = "Acq"
        self._acquire = True
        self.integration_mode = False
        self.background =  np.array([], dtype=np.float64)
        self.img_sz_y = int(np.floor(self.cam_y / self.bin_sz))
        self.img_sz_x = int(np.floor(self.cam_x / self.bin_sz))
        self._background =   np.zeros((self.img_sz_y,self.img_sz_x), dtype=np.float64)
        self.background =  np.zeros((self.img_sz_y,self.img_sz_x), dtype=np.float64)
        # change img x and y on background, _background

    def take_image(self):
        # pan comment, is ims here necessary? is the img not enough?
        """
        the wait function should be properly implemented to get the optimum speed out of
        the multiple frame collection, the INTERNAL_FRAMEINTERVAL function should be useful
        to be implemented for this DCAM_IDPROP_INTERNAL_FRAMEINTERVAL
        """
        # if self._acquire:
        ims = np.zeros((self.img_sz_y, self.img_sz_x)) 
        self.hcam.startAcquisition()
        time.sleep(self.exposure[0] * self.num + 0.0249 * (self.num + 2))  # frame_interval is 0.0249,
        # added 2 times more because in the limit of 1-2ms exposures frames were lost
        the_frames = self.get_all_frames()
        for i in range(self.num):
            try:
                img = np.reshape(self.get_grey_values_o_frames(the_frames, i), (self.img_sz_y, self.img_sz_x))
                # img = np.fliplr(img)  # fixme: commented this out for roi to work proper, but in Preview .T is
                #  still used because of how setImage works, if need be changed back jah needs reconfigure roi input
                #  as abs(2048-hpos) [I sink]
                ims = np.add(ims, img)
            except Exception as e:
                print(e)

        # self.im.emit(ims.astype(np.float64))  # this used as the preview, its emitted and grabbed by the main thread # pan
        self.last_frame = ims.astype(np.float64)  # this is what me_tropo_lys is using
        self._show_preview = False
        self.hcam.stopAcquisition()


        # return (ims.astype(np.float64) - self.background) # pan # also second comment pan
        # # return ims.astype(np.float64) # pan
        
        #new_test for the bacground removal case_
        _final_image = (ims.astype(np.float64) - self.background)
        zero_array = np.zeros(_final_image.shape, dtype=_final_image.dtype)
        # print("Zero array", zero_array)
        
        # code to replace all negative value with 0
        final_image = np.maximum(_final_image, zero_array) # this will make all he negative values 0
        return final_image





    def take_average_image(self, num: int):
        """Capture and return an average image from a number of captures.

        Parameters
        ----------
        num : int
            The number of images to capture and average.

        Returns
        -------
        np.ndarray
            The averaged image as a NumPy array.
        """
        # print("getting average of {} images, mpesa".format(num)) # pan
        # self.num = num
        # self.mode = "Acq"
        # self.end()
        # self.rec_mode()
        # self.camera_start()
        # self.wait()
        # images = self.last_frame / num

        # have put emit here to get correct scale
        # self.im.emit(images.astype(np.float64))  # this used as the preview, its emitted and grabbed by the main thread # pan
        # return images # pan
        print("getting average of {} images".format(num))
        images = np.stack([self.take_image() for _ in range(num)])
        return images.mean(axis=0)

    def take_integrated_image(self, num: int, acq_intgr: int):
        # fixme: cp description from base above
        """.
        """
        print("getting average of {} integrated images, a ha a".format(num))
        print("{} image frames each".format(acq_intgr))
        self.num = num * acq_intgr
        self.mode = "Acq"
        self.end()
        self.rec_mode()
        self.camera_start()
        self.wait()
        # print("last frame max {}".format(np.max(self.last_frame)))
        images = self.last_frame / num
        # print("averaged max {}".format(np.max(images)))
        # self.num = 1 * acq_intgr  # restores frame number
        return images

    def live(self):
        self.hcam.startAcquisition()
        # first_img = False
        self._show_preview = True
        self.all_frames = []
        n_frames = 0
        while self._show_preview:
            try:
                img = np.reshape(self.get_grey_values(), (self.img_sz_y, self.img_sz_x))
                # img = np.fliplr(img)  # fixme: commented this out for roi to work proper, but in Preview .T is
                #  still used because of how setImage works, if need be chamged back jah needs reconfigure roi input
                #  as abs(2048-hpos) [I sink]
                # self.im.emit(img.astype(np.float64)) # pan
                # pan, here we could display it on a new window just for live to exist
                # pan for now we put he following print and a break
                self.current_frame = img.copy()
                # self.all_frames.append(self.current_frame)
                # print('Live is on but we will break it, pan') # pan 
                # break # pan
                n_frames += 1
                print(n_frames)
            except Exception as e:
                pass

    def rec_mode(self):
        if self.mode == "Acq":
            # self._acquire = True
            self.hcam.setACQMode('fixed_length', number_frames=self.num)
        else:
            # self._acquire = False
            self._show_preview = True  # fixme: this usefull still?
            self.hcam.setACQMode('run_till_abort', number_frames=None)

    def camera_start(self): # pan, it was run, for the qthread start() function, if you want to go back, elsewhere change it for start()
        if self.mode == "Acq":
           return self.take_image()
        else:
            self.live()

    def end(self):
        """ends the thread to stop live acquisition,
            when acquiring frames the camera is stopped after each run"""
        self._show_preview = False
        self.hcam.stopAcquisition()
        super(CaptureHamamatsu, self).end()


if __name__ == "__main__":
    pass

