#!/usr/bin/env python
#  tests.py: multiple tests to be performed on each IP address
#  one class per test
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

import dns.resolver
import config
import sys

class Test:
        def __init__(self):
                pass
        
        def passed(self,ip,value):
            if config.debug: print >> sys.stderr,"test:" + self.name + ", ip: "+ip + ", result:" + str(value)
            return {"test":self.name,"ip":ip,"result":value}

class Openrecursor(Test):
        name="DNS Recursor"
        def __init__(self,host="www.google.com"):
                self.resolver=dns.resolver.Resolver()
                self.resolver.timeout=0.5
                self.resolver.lifetime=0.5
                self.host=host

        def test(self,ip):
                self.resolver.nameservers=[ip]
                try:
                        query=self.resolver.query(self.host)
                        return self.passed(ip,True)
                except:
                        return self.passed(ip,False)

class DNSChanger(Test):
        name="DNS Changer"
        def __init__(self):
                self.resolver=dns.resolver.Resolver()
                self.resolver.timeout=0.5
                self.resolver.lifetime=0.5

        def test(self,ip):
                self.resolver.nameservers=[ip]
                try:
                        query=self.resolver.query("wake.lo-res.org")
                        return self.passed(ip,
                                self.is_changed(query[0].address))
                except:
                       return self.passed(ip,False) 
        
        def is_changed(self,address):
                if address!="78.41.115.196":
                        return address
                else:
                        return False

class SSHDefault(Test):
        name="SSH Default Password"
        def __init__(self):
                import paramiko
                self.ssh=paramiko.SSHClient()
                self.ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        
        def test(self,ip):
                try:
                        self.ssh.connect(ip,username="root",password="admin",
                                timeout=1)
                        self.ssh.close()        
                        return self.passed(ip,True)
                except:
                        return self.passed(ip,False)
