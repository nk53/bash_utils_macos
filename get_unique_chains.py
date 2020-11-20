#!/usr/bin/env python2
# For reading CHARMM PSF files to get the number of segids
from sys import argv
import re

filename = argv[1]
natom_regex = re.compile(r" *(\d+) *!NATOM")

segids = set() # isolate only the unique ones
with open(filename) as fh:
    natom = -1
    for line in fh:
        if natom == -1:
            match = natom_regex.match(line)
            if match:
                natom = int(match.group(1))
        else:
            if natom <= 0:
                break
            line = line.split()
            segid = line[1]
            segids.add(segid)
            natom -= 1

segids = list(segids)
segids.sort()
for segid in segids:
    print segid
