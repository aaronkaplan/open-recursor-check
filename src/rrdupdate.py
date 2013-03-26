#!/usr/bin/env python
#
#  rrdupdate.py: read a file (stdin) for lines in the format:
#   20120604-00:48 181
#  and convert them into a format which is useable for the rrdtool update 
#  command.
#  
#
#  Copyright (C) 2012-2013, Michael Bauer <mihi@tentacleriot.eu>
#  and L. Aaron Kaplan <kaplan@cert.at>
#
#  This program is free software: you can redistribute it and/or modify it
#  under the terms of the GNU Affero General Public License as published by the
#  Free Software Foundation, either version 3 of the License, or (at your
#  option) any later version.
#
#  This program is distributed in the hope that it will be useful, but WITHOUT
#  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
#  details.
#
#  You should have received a copy of the GNU Affero General Public License
#  along
#  with this program.  If not, see <http://www.gnu.org/licenses/>.

import time
import fileinput
import pprint
import re

# file format to read and parse:
# 
#20120604-00:48 181
#20120604-01:25 175

#line="20120604-00:48 181"

for line in fileinput.input():
    # if line does not match, skip
    if (not re.match("[0-9]{8}\-[0-9]{2}:[0-9]{2}", line)):
        continue
    ts,val = line.rstrip().split(" ")
    st = time.strptime(ts, '%Y%m%d-%H:%M')
    print "%s:%s" %(int(time.mktime(st)), val)

