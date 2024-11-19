from hamamatsu_orca_sdk import InitCam, HamamatsuCamera
from orca_camera import CaptureHamamatsu 
import numpy as np
import json


def camera_init():
    """
    Check for Available cameras, this should 
    use the class InitCam()
    """
    global initialized_cameras
    initialized_cameras = InitCam()
    available_cameras = []
    for i in range(initialized_cameras.n_cam):
        cam = HamamatsuCamera(i)
        available_cameras.append(cam.getModelInfo(i))
        cam.shutdown()
    aliases = [str(cam) for cam in available_cameras]
    addresses = [i for i in range(len(available_cameras))]
    cameras = {'Instrument Aliases':aliases,'Instrument Addresses':addresses}
    json_out = json.loads(cameras)
    return json_out

def camera_deinit():
    del initialized_cameras

def camera_connect(camera_id, exposure, trigger = 1):
    """
        Open the connection to the camera specified by camera_id.
        This is happening by define an object of the Hamamatsu Camera Class
    """
    camera_id = int(camera_id) - 1
    global camera
    camera = CaptureHamamatsu(camera_id, exposure, trigger)

def camera_disconnect():
    """
    Close down the connection to the camera.
    Uses the shutdown function of the Hamamatsu Camera class
    """
    camera.shutdown()
    return 0

def camera_start_live():
    camera.hcam.setACQMode('run_till_abort')
    camera.hcam.startAcquisition()
    return True

def camera_stop_live():
    camera.hcam.stopAcquisition()
    return False

def camera_get_frame():
    try:
        frame = np.reshape(camera.get_grey_values(), (camera.img_sz_y, camera.img_sz_x)) 
        camera.current_frame = frame
        return frame.tolist()
    except Exception as e:
        return camera.current_frame.tolist()

def camera_single_capture():
    camera.current_frame = camera.take_image()
    return camera.current_frame.tolist()

def camera_average_single_captures(number_of_averages):
    return camera.take_average_image(number_of_averages)

def camera_update_exposure(new_exposure):
    camera.exposure = new_exposure

    