#!/usr/bin/env python

import serial
import re

def parse_line (line):
    line = line.decode('ascii').strip('\n').strip('\r')
    #numbers = [int(s) for s in line.split() if s.isdigit()]
    numbers = re.findall('\d+', line)

    try:
        return (int(numbers[2]), int(numbers[3]))
    except:
        return (-1, -1)

with serial.Serial('/dev/ttyUSB0', 115200) as ser:

    print('co2e_ppm, tvoc_ppb')

    while (1):

        co2e, tvoc = parse_line(ser.readline())

        if co2e <= 0 or tvoc < 0:
            continue

        print(str(co2e) + ", " + str(tvoc))
