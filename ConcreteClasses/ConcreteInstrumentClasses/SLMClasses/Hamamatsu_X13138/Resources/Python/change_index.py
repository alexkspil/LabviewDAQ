import numpy as np

def change_index(array):
    np_array = np.array(array)*2
    np_array = np.flip(np_array,0)
    return np_array.tolist()