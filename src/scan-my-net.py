#!/usr/bin/env python
#
#  scan-my-net.py: This script can scan a list of specific network ranges
#  and perform certain tests for each IP.  The tests are plugins 
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
#  You should have received a copy of the GNU Affero General Public License along
#  with this program.  If not, see <http://www.gnu.org/licenses/>.


from scanner import Scanner
from tests import Openrecursor,DNSChanger,SSHDefault
import json
import config


ranges=["192.168.0.0/24","10.0.0.0/16"]
#tests=[Openrecursor(),DNSChanger(),SSHDefault()]
tests=[Openrecursor()]
s=Scanner(ranges)
openrecursors=s.scan(tests)
print json.dumps(openrecursors)
