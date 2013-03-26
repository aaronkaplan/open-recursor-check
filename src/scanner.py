#!/usr/bin/env python
#  scan.py: The main scanner object
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
#
from ip import Range
import config

class Scanner:
        def __init__(self,ranges):
                self.ranges=[Range(r) for r in ranges]
                if config.debug: print self.ranges
                #self.ips=sum((x.ips for x in self.ranges))
                self.ips=reduce(lambda x,y: x+y, [x.ips for x in self.ranges])

        def scan(self,tests):
                return map(lambda ip: map(lambda x: x.test(ip), tests),self.ips)
                
                        
                        
                
