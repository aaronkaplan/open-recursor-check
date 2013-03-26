#!/bin/bash

cd /home/akaplan/openrecursors/scanning
now=$(date +"%Y%m%d-%H:%M")

out="$now-recursors.txt"
out2="recursors.txt"
./scan-my-net.py 2> history/$out && (grep True history/$out | awk '// { print $4; }' | tr -d , > $out2 )
cnt=$(wc -l $out2 | cut -d " " -f 1)
# save space
gzip history/$out

echo "$now $cnt" >> stats.txt

# update graph

export GDFONTPATH=/usr/share/fonts/truetype/ttf-bitstream-vera/
/usr/bin/gnuplot-nox plotstats.gpl
# this is inefficient right now and re-creates the RRD and the graphs every time
./init.sh


# the resulting list is now in $out2

