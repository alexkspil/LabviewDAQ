# Read_PTU.py    Read PicoQuant Unified Histogram Files
# This is demo code. Use at your own risk. No warranties.
# Keno Goertz, PicoQUant GmbH, February 2018

# Note that marker events have a lower time resolution and may therefore appear 
# in the file slightly out of order with respect to regular (photon) event records.
# This is by design. Markers are designed only for relatively coarse 
# synchronization requirements such as image scanning. 

# T Mode data are written to an output file [filename]
# We do not keep it in memory because of the huge amout of memory
# this would take in case of large files. Of course you can change this, 
# e.g. if your files are not too big. 
# Otherwise it is best process the data on the fly and keep only the results.

# Tag Types
# tyEmpty8 = struct.unpack(">i", bytes.fromhex("FFFF0008"))[0]
# tyBool8 = struct.unpack(">i", bytes.fromhex("00000008"))[0]
# tyInt8 = struct.unpack(">i", bytes.fromhex("10000008"))[0]
# tyBitSet64 = struct.unpack(">i", bytes.fromhex("11000008"))[0]
# tyColor8 = struct.unpack(">i", bytes.fromhex("12000008"))[0]
# tyFloat8 = struct.unpack(">i", bytes.fromhex("20000008"))[0]
# tyTDateTime = struct.unpack(">i", bytes.fromhex("21000008"))[0]
# tyFloat8Array = struct.unpack(">i", bytes.fromhex("2001FFFF"))[0]
# tyAnsiString = struct.unpack(">i", bytes.fromhex("4001FFFF"))[0]
# tyWideString = struct.unpack(">i", bytes.fromhex("4002FFFF"))[0]
# tyBinaryBlob = struct.unpack(">i", bytes.fromhex("FFFFFFFF"))[0]
#
# Record types
# rtMultiHarpNT3 = struct.unpack(">i", bytes.fromhex('00010307'))[0]
# rtMultiHarpNT2 = struct.unpack(">i", bytes.fromhex('00010207'))[0]


def gotOverflow(count, ovfldict):
    global recNum
    ovfldict['recNum'].append(recNum)
    ovfldict['Count'].append(count)
    return ovfldict

def gotMarker(timeTag, markers, markerdict):
    global recNum
    markerdict['recNum'].append(recNum)
    markerdict['Marker'].append(markers)
    markerdict['TimeTag'].append(timeTag)
    return markerdict

def gotPhoton(timeTag, channel, dtime, isT2, photondict):
    global recNum
    if isT2:
        photondict['recNum'].append(recNum)
        photondict['Channel'].append(channel)
        photondict['TimeTag'].append(timeTag)
        photondict['Real Time'].append(timeTag*globRes)
        return photondict

    else:
        photondict['recNum'].append(recNum)
        photondict['Channel'].append(channel)
        photondict['nsync'].append(timeTag)
        photondict['Real Time'].append(timeTag * globRes*1e-3)
        photondict['dtime'].append(dtime)
        return photondict

def readHT3(inputfile, version):
    import struct
    import sys

    isT2 = False

    global recNum, oflcorrection, numRecords

    photondata = {'recNum': [], 'Channel': [], 'Real Time': [], 'nsync':[], 'dtime': []}
    markerdata = {'recNum': [], 'Marker': [], 'TimeTag': []}
    ovfldata = {'recNum': [], 'Count': []}

    T3WRAPAROUND = 1024
    for recNum in range(0, numRecords):
        try:
            recordData = "{0:0{1}b}".format(struct.unpack("<I", inputfile.read(4))[0], 32)
        except:
            print("The file ended earlier than expected, at record %d/%d." \
                  % (recNum, numRecords))
            return photondata, markerdata, ovfldata

        special = int(recordData[0:1], base=2)
        channel = int(recordData[1:7], base=2)
        dtime = int(recordData[7:22], base=2)
        nsync = int(recordData[22:32], base=2)
        if special == 1:
            if channel == 0x3F:  # Overflow
                # Number of overflows in nsync. If 0 or old version, it's an
                # old style single overflow
                if nsync == 0 or version == 1:
                    oflcorrection += T3WRAPAROUND
                    ovfldata = gotOverflow(1, ovfldata)
                else:
                    oflcorrection += T3WRAPAROUND * nsync
                    ovfldata = gotOverflow(nsync, ovfldata)
            if channel >= 1 and channel <= 15:  # markers
                truensync = oflcorrection + nsync
                markerdata = gotMarker(truensync, channel, markerdata)
        else:  # regular input channel
            truensync = oflcorrection + nsync
            photondata = gotPhoton(truensync, channel, dtime, isT2, photondata)
        if recNum % 100000 == 0:
            sys.stdout.write("\rProgress: %.1f%%" % (float(recNum) * 100 / float(numRecords)))
            sys.stdout.flush()
    return photondata, markerdata, ovfldata

def readHT2(inputfile, version):
    import struct
    import sys

    photondata = {'recNum': [], 'Channel': [], 'TimeTag': [], 'Real Time': []}
    markerdata = {'recNum': [], 'Marker': [], 'TimeTag': []}
    ovfldata = {'recNum': [], 'Count': []}

    isT2 = True

    global recNum, oflcorrection, numRecords

    T2WRAPAROUND_V1 = 33552000
    T2WRAPAROUND_V2 = 33554432
    for recNum in range(0, numRecords):
        try:
            recordData = "{0:0{1}b}".format(struct.unpack("<I", inputfile.read(4))[0], 32)
        except:
            print("The file ended earlier than expected, at record %d/%d." \
                  % (recNum, numRecords))
            return photondata, markerdata, ovfldata

        special = int(recordData[0:1], base=2)
        channel = int(recordData[1:7], base=2)
        timetag = int(recordData[7:32], base=2)
        if special == 1:
            if channel == 0x3F:  # Overflow
                # Number of overflows in nsync. If old version, it's an
                # old style single overflow
                if version == 1:
                    oflcorrection += T2WRAPAROUND_V1
                    ovfldata = gotOverflow(1, ovfldata)
                else:
                    if timetag == 0:  # old style overflow, shouldn't happen
                        oflcorrection += T2WRAPAROUND_V2
                        ovfldata = gotOverflow(1, ovfldata)
                    else:
                        oflcorrection += T2WRAPAROUND_V2 * timetag
            if channel >= 1 and channel <= 15:  # markers
                truetime = oflcorrection + timetag
                markerdata = gotMarker(truetime, channel, markerdata)
            if channel == 0:  # sync
                truetime = oflcorrection + timetag
                photondata = gotPhoton(truetime, 0, 0, isT2, photondata)
        else:  # regular input channel
            truetime = oflcorrection + timetag
            photondata = gotPhoton(truetime, channel + 1, 0, isT2, photondata)
        if recNum % 100000 == 0:
            sys.stdout.write("\rProgress: %.1f%%" % (float(recNum) * 100 / float(numRecords)))
            sys.stdout.flush()
    return photondata, markerdata, ovfldata

def main(file):

    from re import split

    global recNum
    global oflcorrection
    global truensync
    global dlen
    global isT2
    global globRes
    global numRecords

    inputfile = open(file, 'rb')

    tags = {}

    while True:
        a = inputfile.readline().decode('utf-8').replace(' \n', '')
        elem = split('  +', a)
        tags[elem[0]] = [elem[1]]
        if elem[0] == 'Header End':
            break

    mode = int(tags['Mode'][0])
    numRecords = int(tags['Records'][0])
    globRes = float(tags['Resolution'][0])

    oflcorrection = 0
    dlen = 0
    if mode == 3:
        photondata, markerdata, ovfldata = readHT3(inputfile, 2)
        return tags, photondata, markerdata, ovfldata

    elif mode == 2:
        photondata, markerdata, ovfldata = readHT2(inputfile, 2)
        return tags, photondata, markerdata, ovfldata
    else:
        print("ERROR: Unknown record type")
        return 0, 0, 0, 0