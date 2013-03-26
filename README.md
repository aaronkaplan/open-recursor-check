open-recursor-check
===================

Tools to check network ranges for open recursive DNS servers
An example of the scripts' output can be seen at 
http://vixie.funkfeuer.at/


Installation
============

Prerequisites
-------------

python 2.6 or higher
python-json
rrdtool

These scripts were tested on Debian squeeze (6.0.7)


Preparations
------------

First create the RRD database:

  $ ./init.sh


Configuration 
------------
Then specify the IP ranges which should be scanned:

  $ vi  scan-my-net.py

Example:

   ranges=["193.238.156.0/22","78.41.112.0/21"]

Change the ranges to your needs


Testing 
------------
Make a test run:
  $ ./scan-my-net.py
 
This should give you an output similar to:

	akaplan@0xffshell:~/openrecursors/scanning$ ./scan-funkfeuer.py
	[<ip.Range instance at 0x24174d0>, <ip.Range instance at 0x2417320>]
	test:DNS Recursor, ip: 193.238.156.0, result:False
	test:DNS Recursor, ip: 193.238.156.1, result:False
	test:DNS Recursor, ip: 193.238.156.2, result:False
	test:DNS Recursor, ip: 193.238.156.3, result:False
	test:DNS Recursor, ip: 193.238.156.4, result:False
	test:DNS Recursor, ip: 193.238.156.5, result:False
	test:DNS Recursor, ip: 193.238.156.6, result:False

Terminate the scan with Ctrl-C or Ctrl-Z and kill %1

If you see some error messages, there is something wrong with your python setup


Permanent installation
----------------------
Add scan-my-net.py to your crontab:

	0  3  *   *   *     ( /home/akaplan/openrecursors/scanning/doit.sh  > /dev/null )

(change the paths according to your installation)


Test the graphs
---------------
init.sh can generate the graphs based on the RRD data.
symlink the graphs to your webservers' DocumentRoot. Now you can see them online :)


Open issues and further research
================================

1) Currently, the init.sh file re-creates the .rrd database completely and
   re-plots every RRD graph . This is inefficient.

2) scanning the network should be done in parallel. Look at 0-mq and related 
   technologies for parallelizing this.


