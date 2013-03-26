#!/bin/bash

# NOTE: this should actually only be called initially. 
# create RRD file
rrdtool create openrecursors.rrd --start 1338763679 --step 1800 DS:num_open_recursors:GAUGE:5400:U:U RRA:AVERAGE:0.5:1:17520

# transform stats.txt 
./rrdupdate.py < stats.txt > rrd-input.txt

for l in $(cat rrd-input.txt ) ; do   rrdtool update openrecursors.rrd $l; done
./plotit.sh 
