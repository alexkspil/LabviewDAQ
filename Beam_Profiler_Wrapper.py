import json
from BeamProfiler import BeamProfiler

def init_beamprofiler(cluster_data):
    kwargs = json.loads(cluster_data)
    global beamprof
    beamprof = BeamProfiler(**kwargs)
    
def calculate_values(image):
    beam_profiler_data = beamprof.calculate_values(image)
    return json.dumps(beam_profiler_data)