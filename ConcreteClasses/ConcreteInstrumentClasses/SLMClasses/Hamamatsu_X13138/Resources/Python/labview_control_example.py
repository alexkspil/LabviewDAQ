from coupling import Coupling
from cavity_methods_LV import Cavity, Mirror, Laser_Beam_Propagation, PI
import json
import numpy as np

def define_cavity(json_string):
    """
    Defines a Cavity Object, according to the parameters given.
    
    First, it creates Mirror Objects, and adds them on the cluster.
    Then, it Creates a global Cavity object "cavo", on which it passes the cluster data as keyword arguments.

    Gets one input:
        - json_string: A json string, designed to be a flattened labview cluster, with information about the cavity Mirrors and cavity parameters
    Does not give an output. The object is accessible to the rest of the wrapper functions in this module.
    """
    
    # Parse the JSON string into a dictionary
    cluster_data = json.loads(json_string)
    
    # Get number of cavity mirrors 
    mirr_num = int(cluster_data['Cavity Parameters']['Number of Mirrors'])
    
    # Create Mirror Objects
    for i in range(mirr_num): 
        cluster_data['Cavity Mirrors'][f'Mirror {i+1}'] = Mirror(*[val for val in cluster_data['Cavity Mirrors'][f'Mirror {i+1}'].values()]) 

    # Define cavo
    global cavo 
    cavo = Cavity(**cluster_data)   


def propagate_init_beam(json_string):
    """
    Propagates the defined laser beam through two lenses.

    Defines a Laser_Beam_Propagation object, which takes a cavity object as an argument, and the cluster data as keyword arguments.

    Gets one input:
        - json_string: As in define_cavity.
    Does not give any output.
    """
    
    cluster_data = json.loads(json_string)
    global laser_beam
    laser_beam = Laser_Beam_Propagation(cavo, **cluster_data)

def get_init_beam():
    """
    Generates the beam shape as it propagates on the z axis, from the laser to the cavity.
    Gets no inputs.
    Returns one output:
        - json_out: A json string, including the beam waist (wz) at different propagation distances (r)
    """

    wz,r = laser_beam.propagate_beam()
    data_out = {'wz': wz, 'r':r}
    json_out = json.dumps(data_out)    
    return json_out
    
def get_cavity_tem00():
    """
    Generates the fundamental cavity mode.
    Gets no inputs.
    Returns one output:
        - json_out: As in get_init_beam.
    """
    beams = cavo.cavo_arm
    
    distances = [sep for sep in cavo.mirror_sep]
    wz =[]
    r = []
    dist=0
    for beam, sep in zip(beams,distances):
        for z in np.linspace(0, sep, 100):
            wz.append(beam.w_z(z))
            r.append(dist+z)
        dist+=sep

    data_out = {'wz': wz, 'r':r}
    json_out = json.dumps(data_out)
    return json_out

def get_params():
    """
    Returns all useful parameters for the cavity characterization, such as stability, minimum waist etc.
    Gets no inputs.
    Returns one output:
        - json_out: A json string with the cavity parameters.
    """

    # Calculate the overlap integral
    # Needed variables:
    # Wavelengths
    beam_wavelength = laser_beam.wavelength * 10 ** -7
    cavity_wavelength = cavo.lamda
    
    # waist and reference of the laser beam
    wo_beam=laser_beam.beam_mirror1_wo
    zo_beam=laser_beam.beam_mirror1_zo

    # waist and reference of the input cavity arm
    wo_cavo = cavo.w_o_arm[0]
    zo_cavo = cavo.z_o_arm[0]
    
    couple = Coupling(wo_beam, wo_cavo, 
                        zo_beam, zo_cavo, 
                        beam_wavelength) # Needs both wavelengths!
    coupling_efficiency = str(round(couple.coupling_efficiency()*100,2)) # Coupling Efficiency
    

    length = str(cavo.cavity_length) # Total Cavity Length
    stability = str(round(cavo.stability()[0],2)) # Cavity Stability
    
    waists = cavo.w_o_arm # All cavity arm waists
    min_waist = str(int(min(waists))) # Minimum waist
    
    divergences = [str(round(np.rad2deg(cavity_wavelength*10**-3/(np.pi*waist)),2)) for waist in waists] # Calculate all cavity arm divergences, i.e. 
                                                                                                         # the divergence of the escaping beams from each arm
    
    
    # Generate a dict with the parameters
    cavity_params_out = {'Length':length, 'Stability':stability,'Coupling Efficiency':coupling_efficiency,
                         'Waist at Focus': min_waist, 'Divergences':divergences}
    json_out = json.dumps(cavity_params_out)
    return json_out    

