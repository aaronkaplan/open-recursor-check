#!/bin/sh

# One day
rrdtool graph stats24h.png --imgformat PNG \
	--title  "Number of open DNS recursors over time (last 24h)" \
	-w 1200 -h 768 \
	--lower-limit 0 \
	--start end-24h --step 1800 \
	--slope-mode \
	--x-grid HOUR:1:HOUR:2:HOUR:1:0:"%H:%M" \
	-c "GRID#535F7A" \
	-c "MGRID#313C47" \
	--watermark "(C) 2013 L. Aaron Kaplan <kaplan@cert.at>" \
	--vertical-label "number of open DNS recursors (24h)" \
	DEF:num_open_recursors=openrecursors.rrd:num_open_recursors:AVERAGE:step=1800 \
	DEF:num_open_recursors_1d=openrecursors.rrd:num_open_recursors:AVERAGE:step=86400 \
	VDEF:ormax=num_open_recursors,MAXIMUM \
    VDEF:oravg=num_open_recursors,AVERAGE \
	VDEF:ormin=num_open_recursors,MINIMUM \
	VDEF:orlast=num_open_recursors,LAST \
	AREA:num_open_recursors#EE0000:"number of open DNS recursors (24h)" \
	"CDEF:shading10=num_open_recursors,0.90,*" "AREA:shading10#E10000" \
	"CDEF:shading15=num_open_recursors,0.85,*" "AREA:shading15#D20000" \
	"CDEF:shading20=num_open_recursors,0.80,*" "AREA:shading20#C30000" \
	"CDEF:shading25=num_open_recursors,0.75,*" "AREA:shading25#B40000" \
	"CDEF:shading30=num_open_recursors,0.70,*" "AREA:shading30#A50A00" \
	"CDEF:shading35=num_open_recursors,0.65,*" "AREA:shading35#960A00" \
	"CDEF:shading40=num_open_recursors,0.60,*" "AREA:shading40#871A00" \
	"CDEF:shading45=num_open_recursors,0.55,*" "AREA:shading45#782A00" \
	"CDEF:shading50=num_open_recursors,0.50,*" "AREA:shading50#693A00" \
	"CDEF:shading55=num_open_recursors,0.45,*" "AREA:shading55#5A4A00" \
	"CDEF:shading60=num_open_recursors,0.40,*" "AREA:shading60#4B5A00" \
	"CDEF:shading65=num_open_recursors,0.35,*" "AREA:shading65#3C6A00" \
	"CDEF:shading70=num_open_recursors,0.30,*" "AREA:shading70#2D7A00" \
	"CDEF:shading75=num_open_recursors,0.25,*" "AREA:shading75#188A00" \
	"CDEF:shading80=num_open_recursors,0.20,*" "AREA:shading80#0F9A00" \
	"CDEF:shading85=num_open_recursors,0.15,*" "AREA:shading85#00AA00" \
	"CDEF:shading90=num_open_recursors,0.10,*" "AREA:shading90#11BA11" \
	"CDEF:shading95=num_open_recursors,0.05,*" "AREA:shading95#21CA21" \
	"COMMENT:\n" \
	GPRINT:ormin:"\tMin\: %05.2lf\t" GPRINT:ormin:"@ %d. %b. %Y %H\:%M\n":strftime \
	GPRINT:ormax:"\tMax\: %05.2lf\t" GPRINT:ormax:"@ %d. %b. %Y %H\:%M\n":strftime \
	GPRINT:oravg:"\tAvg\: %05.2lf\t" GPRINT:oravg:"@ %d. %b. %Y %H\:%M\n":strftime \
	GPRINT:orlast:"\tLast\: %05.2lf\t" GPRINT:orlast:"@ %d. %b. %Y %H\:%M\n":strftime \
	"COMMENT:\n" \
	LINE:oravg#535F7A:"average number of open DNS recursors (in the last 24h)" \


# One Week
rrdtool graph stats1w.png --imgformat PNG \
	--title  "Number of open DNS recursors over time (last week)" \
	-w 1200 -h 768 \
	--lower-limit 0 \
	--start end-7d --step 1800 \
	--slope-mode \
	--x-grid HOUR:12:DAY:1:DAY:1:0:"%d.%b.%Y-%H:%M" \
	-c "GRID#535F7A" \
	-c "MGRID#313C47" \
	--watermark "(C) 2013 L. Aaron Kaplan <kaplan@cert.at>" \
	--vertical-label "number of open DNS recursors (1 week)" \
	DEF:num_open_recursors=openrecursors.rrd:num_open_recursors:AVERAGE:step=1800 \
	DEF:num_open_recursors_1d=openrecursors.rrd:num_open_recursors:AVERAGE:step=86400 \
	VDEF:ormax=num_open_recursors,MAXIMUM \
    VDEF:oravg=num_open_recursors,AVERAGE \
	VDEF:ormin=num_open_recursors,MINIMUM \
	VDEF:orlast=num_open_recursors,LAST \
	AREA:num_open_recursors#EE0000:"number of open DNS recursors (24h)" \
	"CDEF:shading10=num_open_recursors,0.90,*" "AREA:shading10#E10000" \
	"CDEF:shading15=num_open_recursors,0.85,*" "AREA:shading15#D20000" \
	"CDEF:shading20=num_open_recursors,0.80,*" "AREA:shading20#C30000" \
	"CDEF:shading25=num_open_recursors,0.75,*" "AREA:shading25#B40000" \
	"CDEF:shading30=num_open_recursors,0.70,*" "AREA:shading30#A50A00" \
	"CDEF:shading35=num_open_recursors,0.65,*" "AREA:shading35#960A00" \
	"CDEF:shading40=num_open_recursors,0.60,*" "AREA:shading40#871A00" \
	"CDEF:shading45=num_open_recursors,0.55,*" "AREA:shading45#782A00" \
	"CDEF:shading50=num_open_recursors,0.50,*" "AREA:shading50#693A00" \
	"CDEF:shading55=num_open_recursors,0.45,*" "AREA:shading55#5A4A00" \
	"CDEF:shading60=num_open_recursors,0.40,*" "AREA:shading60#4B5A00" \
	"CDEF:shading65=num_open_recursors,0.35,*" "AREA:shading65#3C6A00" \
	"CDEF:shading70=num_open_recursors,0.30,*" "AREA:shading70#2D7A00" \
	"CDEF:shading75=num_open_recursors,0.25,*" "AREA:shading75#188A00" \
	"CDEF:shading80=num_open_recursors,0.20,*" "AREA:shading80#0F9A00" \
	"CDEF:shading85=num_open_recursors,0.15,*" "AREA:shading85#00AA00" \
	"CDEF:shading90=num_open_recursors,0.10,*" "AREA:shading90#11BA11" \
	"CDEF:shading95=num_open_recursors,0.05,*" "AREA:shading95#21CA21" \
	"COMMENT:\n" \
	GPRINT:ormin:"\tMin\: %05.2lf\t" GPRINT:ormin:"@ %d. %b. %Y %H\:%M\n":strftime \
	GPRINT:ormax:"\tMax\: %05.2lf\t" GPRINT:ormax:"@ %d. %b. %Y %H\:%M\n":strftime \
	GPRINT:oravg:"\tAvg\: %05.2lf\t" GPRINT:oravg:"@ %d. %b. %Y %H\:%M\n":strftime \
	GPRINT:orlast:"\tLast\: %05.2lf\t" GPRINT:orlast:"@ %d. %b. %Y %H\:%M\n":strftime \
	"COMMENT:\n" \
	LINE:oravg#535F7A:"average number of open DNS recursors (in the last week)" \


# One Month
rrdtool graph stats1m.png --imgformat PNG \
	--title  "Number of open DNS recursors over time (month)" \
	-w 1200 -h 768 \
	--lower-limit 0 \
	--start end-1m --step 1800 \
	--slope-mode \
	--x-grid DAY:1:WEEK:1:WEEK:1:0:"%d.%b.%Y-%H:%M" \
	-c "GRID#535F7A" \
	-c "MGRID#313C47" \
	--watermark "(C) 2013 L. Aaron Kaplan <kaplan@cert.at>" \
	--vertical-label "number of open DNS recursors (1 month)" \
	DEF:num_open_recursors=openrecursors.rrd:num_open_recursors:AVERAGE:step=7200 \
	DEF:num_open_recursors_1d=openrecursors.rrd:num_open_recursors:AVERAGE:step=86400 \
	VDEF:ormax=num_open_recursors,MAXIMUM \
    VDEF:oravg=num_open_recursors,AVERAGE \
	VDEF:ormin=num_open_recursors,MINIMUM \
	VDEF:orlast=num_open_recursors,LAST \
	AREA:num_open_recursors#EE0000:"number of open DNS recursors (1 month)" \
	"CDEF:shading10=num_open_recursors,0.90,*" "AREA:shading10#E10000" \
	"CDEF:shading15=num_open_recursors,0.85,*" "AREA:shading15#D20000" \
	"CDEF:shading20=num_open_recursors,0.80,*" "AREA:shading20#C30000" \
	"CDEF:shading25=num_open_recursors,0.75,*" "AREA:shading25#B40000" \
	"CDEF:shading30=num_open_recursors,0.70,*" "AREA:shading30#A50A00" \
	"CDEF:shading35=num_open_recursors,0.65,*" "AREA:shading35#960A00" \
	"CDEF:shading40=num_open_recursors,0.60,*" "AREA:shading40#871A00" \
	"CDEF:shading45=num_open_recursors,0.55,*" "AREA:shading45#782A00" \
	"CDEF:shading50=num_open_recursors,0.50,*" "AREA:shading50#693A00" \
	"CDEF:shading55=num_open_recursors,0.45,*" "AREA:shading55#5A4A00" \
	"CDEF:shading60=num_open_recursors,0.40,*" "AREA:shading60#4B5A00" \
	"CDEF:shading65=num_open_recursors,0.35,*" "AREA:shading65#3C6A00" \
	"CDEF:shading70=num_open_recursors,0.30,*" "AREA:shading70#2D7A00" \
	"CDEF:shading75=num_open_recursors,0.25,*" "AREA:shading75#188A00" \
	"CDEF:shading80=num_open_recursors,0.20,*" "AREA:shading80#0F9A00" \
	"CDEF:shading85=num_open_recursors,0.15,*" "AREA:shading85#00AA00" \
	"CDEF:shading90=num_open_recursors,0.10,*" "AREA:shading90#11BA11" \
	"CDEF:shading95=num_open_recursors,0.05,*" "AREA:shading95#21CA21" \
	"COMMENT:\n" \
	GPRINT:ormin:"\tMin\: %05.2lf\t" GPRINT:ormin:"@ %d. %b. %Y %H\:%M\n":strftime \
	GPRINT:ormax:"\tMax\: %05.2lf\t" GPRINT:ormax:"@ %d. %b. %Y %H\:%M\n":strftime \
	GPRINT:oravg:"\tAvg\: %05.2lf\t" GPRINT:oravg:"@ %d. %b. %Y %H\:%M\n":strftime \
	GPRINT:orlast:"\tLast\: %05.2lf\t" GPRINT:orlast:"@ %d. %b. %Y %H\:%M\n":strftime \
	"COMMENT:\n" \
	LINE:oravg#535F7A:"average number of open DNS recursors (in the last month)" \



# All time
rrdtool graph stats2.png --imgformat PNG \
	--title  "Number of open DNS recursors over time" \
	-w 1200 -h 768 \
	--lower-limit 0 \
	--start 1338763680 --step 1800 \
	--slope-mode \
	--x-grid WEEK:1:WEEK:2:WEEK:2:0:"%d.%b.%y" \
	-c "GRID#535F7A" \
	-c "MGRID#313C47" \
	--watermark "(C) 2013 L. Aaron Kaplan <kaplan@cert.at>" \
	--vertical-label "number of open DNS recursors" \
	DEF:num_open_recursors=openrecursors.rrd:num_open_recursors:AVERAGE:step=7200 \
	DEF:num_open_recursors_1d=openrecursors.rrd:num_open_recursors:AVERAGE:step=86400 \
	DEF:num_open_recursors_1w=openrecursors.rrd:num_open_recursors:AVERAGE:step=604800 \
	VDEF:ormax=num_open_recursors,MAXIMUM \
    VDEF:oravg=num_open_recursors,AVERAGE \
	VDEF:ormin=num_open_recursors,MINIMUM \
	VDEF:orlast=num_open_recursors,LAST \
	AREA:num_open_recursors#EE0000:"number of open DNS recursors" \
	"CDEF:shading10=num_open_recursors,0.90,*" "AREA:shading10#E10000" \
	"CDEF:shading15=num_open_recursors,0.85,*" "AREA:shading15#D20000" \
	"CDEF:shading20=num_open_recursors,0.80,*" "AREA:shading20#C30000" \
	"CDEF:shading25=num_open_recursors,0.75,*" "AREA:shading25#B40000" \
	"CDEF:shading30=num_open_recursors,0.70,*" "AREA:shading30#A50A00" \
	"CDEF:shading35=num_open_recursors,0.65,*" "AREA:shading35#960A00" \
	"CDEF:shading40=num_open_recursors,0.60,*" "AREA:shading40#871A00" \
	"CDEF:shading45=num_open_recursors,0.55,*" "AREA:shading45#782A00" \
	"CDEF:shading50=num_open_recursors,0.50,*" "AREA:shading50#693A00" \
	"CDEF:shading55=num_open_recursors,0.45,*" "AREA:shading55#5A4A00" \
	"CDEF:shading60=num_open_recursors,0.40,*" "AREA:shading60#4B5A00" \
	"CDEF:shading65=num_open_recursors,0.35,*" "AREA:shading65#3C6A00" \
	"CDEF:shading70=num_open_recursors,0.30,*" "AREA:shading70#2D7A00" \
	"CDEF:shading75=num_open_recursors,0.25,*" "AREA:shading75#188A00" \
	"CDEF:shading80=num_open_recursors,0.20,*" "AREA:shading80#0F9A00" \
	"CDEF:shading85=num_open_recursors,0.15,*" "AREA:shading85#00AA00" \
	"CDEF:shading90=num_open_recursors,0.10,*" "AREA:shading90#11BA11" \
	"CDEF:shading95=num_open_recursors,0.05,*" "AREA:shading95#21CA21" \
	"COMMENT:\n" \
	GPRINT:ormin:"\tMin\: %05.2lf\t" GPRINT:ormin:"@ %d. %b. %Y %H\:%M\n":strftime \
	GPRINT:ormax:"\tMax\: %05.2lf\t" GPRINT:ormax:"@ %d. %b. %Y %H\:%M\n":strftime \
	GPRINT:oravg:"\tAvg\: %05.2lf\t" GPRINT:oravg:"@ %d. %b. %Y %H\:%M\n":strftime \
	GPRINT:orlast:"\tLast\: %05.2lf\t" GPRINT:orlast:"@ %d. %b. %Y %H\:%M\n":strftime \
	"COMMENT:\n" \
	LINE:oravg#535F7A:"average number of open DNS recursors (overall)" \

	#HRULE:30#00CC00:"Goal for FF"
	#LINE:num_open_recursors_1d#777777:"averaged over 1 day" \

	#COMMENT:"open recursors" \
	#LINE:num_open_recursors#FF861C \
	#LINE2:num_open_recursors#535F7A:"number of open DNS recursors" \	# blue

	#AREA:num_open_recursors#E31B1B:"number of open DNS recursors" \
	#LINE:num_open_recursors#FF861C \
	#LINE:oravg#AAAAAA:"average number of open DNS recursors (overall)" \
	#LINE:num_open_recursors_1w#AAAAAA:"averaged over 1 week" \
	#LINE2:num_open_recursors_1d#FF861C \
	# --upper-limit 200 \
	#LINE2:num_open_recursors_1w#FFE51C;
