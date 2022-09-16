#!/bin/bash

##Modo de usar $bash MalfindFor.sh file_path profile
file_path=$1
profile=$2

for pid in $(python2.7 /opt/volatility/vol.py -f $1 --profile=$2 pslist | sed "s/  / /g" |  sed "s/  / /g" |  sed "s/  / /g" |  sed "s/  / /g" |  sed "s/  / /g" |  sed "s/  / /g" | cut -d " " -f3 | egrep -v "PID|-" | sort | uniq)
do python2.7 /opt/volatility/vol.py -f $1 --profile=$2 malfind -p $pid 2> /dev/null | egrep "^0x|Process|Vad|Flags" && echo ""
done
