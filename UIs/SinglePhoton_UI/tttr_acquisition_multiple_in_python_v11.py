def func_init(tacq, mode, syncDivider, syncLvlTrg, syncEdgeTrg, syncChannelOffset, Channels, binning, offset, filename,
              dirname, nacq):
    import ctypes as ct
    from ctypes import byref
    import os
    import sys
    import struct
    import time
    import datetime

    # From mhdefin.h
    LIB_VERSION = "2.0"
    MAXDEVNUM = 8
    MODE_T2 = 2
    MODE_T3 = 3
    MAXLENCODE = 6
    MAXINPCHAN = 16
    TTREADMAX = 1048576
    FLAG_OVERFLOW = 0x0001
    FLAG_FIFOFULL = 0x0002

    # Variables to store information read from DLLs
    buffer = (ct.c_uint * TTREADMAX)()
    dev = []
    libVersion = ct.create_string_buffer(b"", 8)
    hwSerial = ct.create_string_buffer(b"", 8)
    hwPartno = ct.create_string_buffer(b"", 8)
    hwVersion = ct.create_string_buffer(b"", 8)
    hwModel = ct.create_string_buffer(b"", 24)
    errorString = ct.create_string_buffer(b"", 40)
    numChannels = ct.c_int()
    resolution = ct.c_double()
    syncRate = ct.c_int()
    countRate = ct.c_int()
    flags = ct.c_int()
    nRecords = ct.c_int()
    ctcstatus = ct.c_int()
    warnings = ct.c_int()
    warningstext = ct.create_string_buffer(b"", 16384)

    if os.name == "nt":
        mhlib = ct.WinDLL("mhlib64.dll")
    else:
        mhlib = ct.CDLL("libmh150.so")

    chan_enabled = [chn[1] for chn in Channels]
    inputEdgeTrg = [chn[2] for chn in Channels]
    inputLvlTrg = [chn[3] for chn in Channels]
    inputChannelOffset = [chn[4] for chn in Channels]
    chan_deadtime_enabled = [chn[5] for chn in Channels]
    chan_deadtime = [chn[6] for chn in Channels]

    def closeDevices():
        for i in range(0, MAXDEVNUM):
            mhlib.MH_CloseDevice(ct.c_int(i))

    def stoptttr():
        retcode = mhlib.MH_StopMeas(ct.c_int(dev[0]))
        closeDevices()

    def tryfunc(retcode, funcName, measRunning=False):
        if retcode < 0:
            mhlib.MH_GetErrorString(errorString, ct.c_int(retcode))
            # print("MH_%s error %d (%s). Aborted." % (funcName, retcode,
            #                                          errorString.value.decode("utf-8")))
            if measRunning:
                stoptttr()
            else:
                closeDevices()

    fnamein = datetime.date.today().strftime("%Y%m%d") + filename
    fname = fnamein.split('.')[0] + '_' + str(0) + '.out'
    i = 0
    while os.path.isfile(os.path.abspath(dirname) + '/' + fname) and i < 1E+4:
        i += 1
        fname_wo_idx = '_'.join(fname.split('_')[:-1])
        fname = fname_wo_idx + '_' + str(i) + '.out'

    outputfile = open(os.path.abspath(dirname) + "/" + fname, "wb+")

    for i in range(0, MAXDEVNUM):
        retcode = mhlib.MH_OpenDevice(ct.c_int(i), hwSerial)
        if retcode == 0:
            print("  %1d        S/N %s" % (i, hwSerial.value.decode("utf-8")))
            dev.append(i)
        else:
            if retcode == -1:  # MH_ERROR_DEVICE_OPEN_FAIL
                print("  %1d        no device" % i)
            else:
                mhlib.MH_GetErrorString(errorString, ct.c_int(retcode))
                print("  %1d        %s" % (i, errorString.value.decode("utf8")))

    if len(dev) < 1:
        closeDevices()
    # with internal clock
    tryfunc(mhlib.MH_Initialize(ct.c_int(dev[0]), ct.c_int(mode), ct.c_int(0)),
            "Initialize")

    tryfunc(mhlib.MH_GetNumOfInputChannels(ct.c_int(dev[0]), byref(numChannels)),
            "GetNumOfInputChannels")

    tryfunc(mhlib.MH_GetResolution(ct.c_int(dev[0]), byref(resolution)),
            "GetNumOfInputChannels")

    tryfunc(
        mhlib.MH_SetSyncEdgeTrg(ct.c_int(dev[0]), ct.c_int(syncLvlTrg),
                                ct.c_int(syncEdgeTrg)),
        "SetSyncEdgeTrg"
    )

    tryfunc(mhlib.MH_SetSyncChannelOffset(ct.c_int(dev[0]), ct.c_int(syncChannelOffset)),
            "SetSyncChannelOffset")

    # we use the same input settings for all channels, you can change this

    for i in range(0, numChannels.value):
        # tryfunc(
        #     mhlib.MH_SetInputEdgeTrg(ct.c_int(dev[0]), ct.c_int(i), ct.c_int(inputLvlTrg[i]),
        #                              ct.c_int(inputEdgeTrg[i])),
        #     "SetInputEdgeTrg"
        # )

        tryfunc(
            mhlib.MH_SetInputEdgeTrg(ct.c_int(dev[0]), ct.c_int(i), ct.c_int(inputLvlTrg[i]),
                                     ct.c_int(inputEdgeTrg[i])),
            "SetInputEdgeTrg"
        )

        tryfunc(
            mhlib.MH_SetInputChannelEnable(ct.c_int(dev[0]), ct.c_int(i), ct.c_int(chan_enabled[i])),
            "SetInputChannelEnable"
        )

        tryfunc(
            mhlib.MH_SetInputChannelOffset(ct.c_int(dev[0]), ct.c_int(i),
                                           ct.c_int(inputChannelOffset[i])),
            "SetInputChannelOffset"
        )
        tryfunc(
            mhlib.MH_SetInputDeadTime(ct.c_int(dev[0]), ct.c_int(i), ct.c_int(chan_deadtime_enabled[i]),
                                      ct.c_int(chan_deadtime[i])),
            "SetInputDeadTime"
        )

    # Meaningful only in T3 mode
    if mode == MODE_T3:
        tryfunc(mhlib.MH_SetBinning(ct.c_int(dev[0]), ct.c_int(binning)), "SetBinning")
        tryfunc(mhlib.MH_SetOffset(ct.c_int(dev[0]), ct.c_int(offset)), "SetOffset")
        tryfunc(mhlib.MH_SetSyncDiv(ct.c_int(dev[0]), ct.c_int(syncDivider)), "SetSyncDiv")
    else:
        tryfunc(mhlib.MH_SetSyncDiv(ct.c_int(dev[0]), ct.c_int(1)), "SetSyncDiv")

    # Note: after Init or SetSyncDiv you must allow >100 ms for valid  count rate readings
    time.sleep(0.2)

    # Write Tags to File
    tagkeys = ['Mode', 'Records', 'Resolution',
               'Acquisition Time', 'Binning', 'Offset',
               'SyncDivider', 'SyncLvl', 'SyncEdge', 'SyncOffset',
               'Chn1Lvl', 'Chn1Edge', 'Chn1Offset',
               'Chn2Lvl', 'Chn2Edge', 'Chn2Offset',
               'Chn3Lvl', 'Chn3Edge', 'Chn3Offset',
               'Chn4Lvl', 'Chn4Edge', 'Chn4Offset',
               'Header End']
    tagvals = [mode, 0, resolution.value,
               tacq, binning, offset,
               syncDivider, syncLvlTrg, syncEdgeTrg, syncChannelOffset,
               inputLvlTrg[0], inputEdgeTrg[0], inputChannelOffset[0],
               inputLvlTrg[1], inputEdgeTrg[1], inputChannelOffset[1],
               inputLvlTrg[2], inputEdgeTrg[2], inputChannelOffset[2],
               inputLvlTrg[3], inputEdgeTrg[3], inputChannelOffset[3],
               True]

    # Start Measurement
    tryfunc(mhlib.MH_StartMeas(ct.c_int(dev[0]), ct.c_int(tacq)), "StartMeas")
    recsout = []
    while True:
        tryfunc(mhlib.MH_GetFlags(ct.c_int(dev[0]), byref(flags)), "GetFlags")

        if flags.value & FLAG_FIFOFULL > 0:
            # print("\nFiFo Overrun!")
            stoptttr()

        tryfunc(
            mhlib.MH_ReadFiFo(ct.c_int(dev[0]), byref(buffer), byref(nRecords)),
            "ReadFiFo", measRunning=True
        )
        if nRecords.value > 0:
            # We could just iterate through our buffer with a for loop, however,
            # this is slow and might cause a FIFO overrun. So instead, we shrinken
            # the buffer to its appropriate length with array slicing, which gives
            # us a python list. This list then needs to be converted back into
            # a ctype array which can be written at once to the output file
            recsout.append((ct.c_uint * nRecords.value)(*buffer[0:nRecords.value]))
            tagvals[1] += nRecords.value
        else:
            tryfunc(mhlib.MH_CTCStatus(ct.c_int(dev[0]), byref(ctcstatus)),
                    "CTCStatus")
            if ctcstatus.value > 0:  # Measurement has finished, time to write the buffer to the file
                bytetagsout = [bytearray("{:<20}{:>15}{:>2}".format(key, str(val), '\n'), 'utf-8') for key, val in
                               zip(tagkeys, tagvals)]
                tagsout = [(ct.c_char * len(tag))(*tag) for tag in bytetagsout]
                for elem in tagsout:
                    # Each line of the array "out" is a ctype array, so it can be written directly to the file
                    outputfile.write(elem)
                for elem in recsout:
                    # Each line of the array "out" is a ctype array, so it can be written directly to the file
                    outputfile.write(elem)
                for i in range(nacq - 1):
                    func_noinit(tacq, mode, syncDivider, syncLvlTrg, syncEdgeTrg, syncChannelOffset, Channels,
                                binning, offset, filename, dirname)
                stoptttr()

                break

    outputfile.close()
    return 6


def func_noinit(tacq, mode, syncDivider, syncLvlTrg, syncEdgeTrg, syncChannelOffset, Channels, binning, offset,
                filename, dirname):
    import ctypes as ct
    from ctypes import byref
    import os
    import datetime

    # From mhdefin.h
    # LIB_VERSION = "2.0"
    MAXDEVNUM = 8
    # MODE_T2 = 2
    # MODE_T3 = 3
    # MAXLENCODE = 6
    # MAXINPCHAN = 16
    TTREADMAX = 1048576
    # FLAG_OVERFLOW = 0x0001
    FLAG_FIFOFULL = 0x0002

    # Variables to store information read from DLLs
    buffer = (ct.c_uint * TTREADMAX)()
    dev = []
    # libVersion = ct.create_string_buffer(b"", 8)
    # hwSerial = ct.create_string_buffer(b"", 8)
    # hwPartno = ct.create_string_buffer(b"", 8)
    # hwVersion = ct.create_string_buffer(b"", 8)
    # hwModel = ct.create_string_buffer(b"", 24)
    errorString = ct.create_string_buffer(b"", 40)
    # numChannels = ct.c_int()
    resolution = ct.c_double()
    # syncRate = ct.c_int()
    # countRate = ct.c_int()
    flags = ct.c_int()
    nRecords = ct.c_int()
    ctcstatus = ct.c_int()
    # warnings = ct.c_int()
    # warningstext = ct.create_string_buffer(b"", 16384)

    if os.name == "nt":
        mhlib = ct.WinDLL("mhlib64.dll")
    else:
        mhlib = ct.CDLL("libmh150.so")

    chan_enabled = [chn[1] for chn in Channels]
    inputEdgeTrg = [chn[2] for chn in Channels]
    inputLvlTrg = [chn[3] for chn in Channels]
    inputChannelOffset = [chn[4] for chn in Channels]
    chan_deadtime_enabled = [chn[5] for chn in Channels]
    chan_deadtime = [chn[6] for chn in Channels]

    def closeDevices():
        for i in range(0, MAXDEVNUM):
            mhlib.MH_CloseDevice(ct.c_int(i))

    def stoptttr():
        retcode = mhlib.MH_StopMeas(ct.c_int(0))
        closeDevices()

    def tryfunc(retcode, funcName, measRunning=False):
        if retcode < 0:
            mhlib.MH_GetErrorString(errorString, ct.c_int(retcode))
            # print("MH_%s error %d (%s). Aborted." % (funcName, retcode,
            #                                          errorString.value.decode("utf-8")))
            if measRunning:
                stoptttr()
            else:
                closeDevices()

    fnamein = datetime.date.today().strftime("%Y%m%d") + filename
    fname = fnamein.split('.')[0] + '_' + str(0) + '.out'
    i = 0
    while os.path.isfile(os.path.abspath(dirname) + '/' + fname) and i < 1E+4:
        i += 1
        fname_wo_idx = '_'.join(fname.split('_')[:-1])
        fname = fname_wo_idx + '_' + str(i) + '.out'

    outputfile = open(os.path.abspath(dirname) + "/" + fname, "wb+")

    # for i in range(0, MAXDEVNUM):
    #     retcode = mhlib.MH_OpenDevice(ct.c_int(i), hwSerial)
    #     if retcode == 0:
    #         print("  %1d        S/N %s" % (i, hwSerial.value.decode("utf-8")))
    #         dev.append(i)
    #     else:
    #         if retcode == -1:  # MH_ERROR_DEVICE_OPEN_FAIL
    #             print("  %1d        no device" % i)
    #         else:
    #             mhlib.MH_GetErrorString(errorString, ct.c_int(retcode))
    #             print("  %1d        %s" % (i, errorString.value.decode("utf8")))
    #
    # if len(dev) < 1:
    #     closeDevices()
    # # with internal clock
    # tryfunc(mhlib.MH_Initialize(ct.c_int(dev[0]), ct.c_int(mode), ct.c_int(0)),
    #         "Initialize")
    #
    # tryfunc(mhlib.MH_GetNumOfInputChannels(ct.c_int(dev[0]), byref(numChannels)),
    #         "GetNumOfInputChannels")
    #
    #
    # tryfunc(
    #     mhlib.MH_SetSyncEdgeTrg(ct.c_int(dev[0]), ct.c_int(syncLvlTrg),
    #                             ct.c_int(syncEdgeTrg)),
    #     "SetSyncEdgeTrg"
    # )
    #
    # tryfunc(mhlib.MH_SetSyncChannelOffset(ct.c_int(dev[0]), ct.c_int(syncChannelOffset)),
    #         "SetSyncChannelOffset")
    #
    # # we use the same input settings for all channels, you can change this
    #
    # for i in range(0, numChannels.value):
    #
    #     # tryfunc(
    #     #     mhlib.MH_SetInputEdgeTrg(ct.c_int(dev[0]), ct.c_int(i), ct.c_int(inputLvlTrg[i]),
    #     #                              ct.c_int(inputEdgeTrg[i])),
    #     #     "SetInputEdgeTrg"
    #     # )
    #
    #     tryfunc(
    #         mhlib.MH_SetInputEdgeTrg(ct.c_int(dev[0]), ct.c_int(i), ct.c_int(inputLvlTrg[i]),
    #                                  ct.c_int(inputEdgeTrg[i])),
    #         "SetInputEdgeTrg"
    #     )
    #
    #     tryfunc(
    #         mhlib.MH_SetInputChannelEnable(ct.c_int(dev[0]), ct.c_int(i), ct.c_int(chan_enabled[i])),
    #         "SetInputChannelEnable"
    #     )
    #
    #     tryfunc(
    #         mhlib.MH_SetInputChannelOffset(ct.c_int(dev[0]), ct.c_int(i),
    #                                        ct.c_int(inputChannelOffset[i])),
    #         "SetInputChannelOffset"
    #     )
    #     tryfunc(
    #         mhlib.MH_SetInputDeadTime(ct.c_int(dev[0]), ct.c_int(i), ct.c_int(chan_deadtime_enabled[i]),
    #                                   ct.c_int(chan_deadtime[i])),
    #         "SetInputDeadTime"
    #     )
    #
    # # Meaningful only in T3 mode
    # if mode == MODE_T3:
    #     tryfunc(mhlib.MH_SetBinning(ct.c_int(dev[0]), ct.c_int(binning)), "SetBinning")
    #     tryfunc(mhlib.MH_SetOffset(ct.c_int(dev[0]), ct.c_int(offset)), "SetOffset")
    #     tryfunc(mhlib.MH_SetSyncDiv(ct.c_int(dev[0]), ct.c_int(syncDivider)), "SetSyncDiv")
    # else:
    #     tryfunc(mhlib.MH_SetSyncDiv(ct.c_int(dev[0]), ct.c_int(1)), "SetSyncDiv")
    #
    #
    # # Note: after Init or SetSyncDiv you must allow >100 ms for valid  count rate readings
    # time.sleep(0.2)
    #
    # Write Tags to File
    tagkeys = ['Mode', 'Records', 'Resolution',
               'Acquisition Time', 'Binning', 'Offset',
               'SyncDivider', 'SyncLvl', 'SyncEdge', 'SyncOffset',
               'Chn1Lvl', 'Chn1Edge', 'Chn1Offset',
               'Chn2Lvl', 'Chn2Edge', 'Chn2Offset',
               'Chn3Lvl', 'Chn3Edge', 'Chn3Offset',
               'Chn4Lvl', 'Chn4Edge', 'Chn4Offset',
               'Header End']
    tagvals = [mode, 0, resolution.value,
               tacq, binning, offset,
               syncDivider, syncLvlTrg, syncEdgeTrg, syncChannelOffset,
               inputLvlTrg[0], inputEdgeTrg[0], inputChannelOffset[0],
               inputLvlTrg[1], inputEdgeTrg[1], inputChannelOffset[1],
               inputLvlTrg[2], inputEdgeTrg[2], inputChannelOffset[2],
               inputLvlTrg[3], inputEdgeTrg[3], inputChannelOffset[3],
               True]

    # Start Measurement
    tryfunc(mhlib.MH_StartMeas(ct.c_int(0), ct.c_int(tacq)), "StartMeas")
    recsout = []
    while True:
        tryfunc(mhlib.MH_GetFlags(ct.c_int(0), byref(flags)), "GetFlags")

        if flags.value & FLAG_FIFOFULL > 0:
            # print("\nFiFo Overrun!")
            stoptttr()

        tryfunc(
            mhlib.MH_ReadFiFo(ct.c_int(0), byref(buffer), byref(nRecords)),
            "ReadFiFo", measRunning=True
        )
        if nRecords.value > 0:
            # We could just iterate through our buffer with a for loop, however,
            # this is slow and might cause a FIFO overrun. So instead, we shrinken
            # the buffer to its appropriate length with array slicing, which gives
            # us a python list. This list then needs to be converted back into
            # a ctype array which can be written at once to the output file
            recsout.append((ct.c_uint * nRecords.value)(*buffer[0:nRecords.value]))
            tagvals[1] += nRecords.value
        else:
            tryfunc(mhlib.MH_CTCStatus(ct.c_int(0), byref(ctcstatus)),
                    "CTCStatus")
            if ctcstatus.value > 0:  # Measurement has finished, time to write the buffer to the file
                bytetagsout = [bytearray("{:<20}{:>15}{:>2}".format(key, str(val), '\n'), 'utf-8') for key, val in
                               zip(tagkeys, tagvals)]
                tagsout = [(ct.c_char * len(tag))(*tag) for tag in bytetagsout]
                for elem in tagsout:
                    # Each line of the array "out" is a ctype array, so it can be written directly to the file
                    outputfile.write(elem)
                for elem in recsout:
                    # Each line of the array "out" is a ctype array, so it can be written directly to the file
                    outputfile.write(elem)
##                stoptttr()  # Stop the measurement
                break

    outputfile.close()
    return 7
