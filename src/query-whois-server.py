#!/usr/bin/env python

import sys
import pprint
import socket   
import select
import errno
import json


# IMPORTANT
# THIS FILE IS BULLSH*T, the best thing would be to 
# change the output of the whois server to JSON and get rid of all of this
# inelegant parsing. 
# At the moment... it works for now. But it is a terrible hack which should 
# be replaced
# Aaron, 2013 Jan 13th

if len(sys.argv) < 2:
    sys.exit('Usage: %s <ipaddress>' % sys.argv[0])

whoisserver="marvin.funkfeuer.at"
port=43

s = socket.socket( socket.AF_INET, socket.SOCK_STREAM)
#s.connect((whoisserver, port))


server = socket.gethostbyname(whoisserver)
s.connect((server, port))


message = sys.argv[1] + "\r\n"
#print ">>> sending: '" + message + "'"

try :
    #Set the whole string
    s.sendall(message)
except socket.error:
    #Send failed
    print 'Send failed'
    sys.exit()

buffer = ''

continue_recv = True

while continue_recv:
    try:
        # Try to receive som data
        chunk = s.recv(1024)
        if (not chunk):
            break
        buffer += chunk
        #print "<< '" + repr(chunk) + "'"
    except s.error, e:
        if e.errno != errno.EWOULDBLOCK:
            # Error! Print it and tell main loop to stop
            print 'Error: %r' % e
            continue_recv = False
        # If e.errno is errno.EWOULDBLOCK, then no more data
        continue_recv = False

# We now have all data we can in "buffer"
#print '%s' % buffer
buffer.replace("you are connected from some allowed range\n", '')
lines = buffer.splitlines()
j = "{"
for l in lines:
    if (l == "you are connected from some allowed range"):
        continue
    if (l == 0):
        break
    l.rstrip('\n')
    k,sep,v = l.partition(':')
    j += '"' + k + '"' + ': "' + v.strip() + '"' + ', '
j += '"foo": "bar"' + '}'

janswer = json.loads(j)

if ('node_name' in janswer):
    nn = janswer['node_name']
else:
    nn = "unknown_node_name"

try:
    print nn + ';' + janswer['ip'] + ";" + janswer['email']
except:
    print >> sys.stderr, "problem mit '" + json.dumps(janswer) + "'"




