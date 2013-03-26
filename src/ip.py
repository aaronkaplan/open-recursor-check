#!/usr/bin/env python
#  ip.py: IP range class
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

class Range:
        def __init__(self,range):
                self.range=range
                self.calculate_ips()
        
        def calculate_ips(self):
                (ip,lim)=self.range.split("/")
                ip=self.ip_to_long(ip)
                shift=32-int(lim)
                ip=ip>>shift
                ip=ip<<shift
                self.ips=[self.long_to_ip(ip+i) for i in range(0,2**shift)]
        
        def ip_to_long(self,ip):
                return reduce (lambda x,y: (x<<8)+y, map(int,ip.split(".")))
        
        def long_to_ip(self,ip):
                return ".".join([str((ip>>(8*n))&255) for n in range(3,-1,-1)])

        def __iter__(self):
                self.index=-1
                return self
        
        def next(self):
                self.index+=1
                if self.index==len(self.ips):
                        raise StopIteration
                return self.ips[self.index]
