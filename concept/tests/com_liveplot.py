#!/usr/bin/env python

# for sgp40
# format voc_index, voc_index_default, temp, hum

import matplotlib.pyplot as plt
import serial
import time
import re

def parse_line (line):
    line   = line.decode('ascii').strip('\n').strip('\r')
    ints   = re.findall('\d+', line)
    floats = re.findall(r"[-+]?\d*\.\d+|\d+", line)

    try:
        return (int(ints[0]), int(ints[1]), float(floats[2]), float(floats[3]))
    except:
        return (-1, -1, -1, -1)

def csv_str (list):
    o = ''
    for item in list:
        o += str(item) + ', ' # consider leaving out last comma

    return o

with serial.Serial('/dev/ttyUSB0', 115200) as ser:

    print('t_sec, voc_index, voc_index_default, temp, hum,')

    while (1):

        voc_index, voc_index_default, temp, hum = parse_line(ser.readline())

        if voc_index <= 0 or voc_index_default <= 0 or temp <= 0 or hum <= 0:
            continue

        seconds = int(time.time())
        plot()

        print(csv_str([seconds, voc_index, voc_index_default, temp, hum]))
