#!/bin/bash

##Use --> $bash MalfindFor.sh file.vmem

file_path=$1

profile=$(python2.7 /opt/volatility/vol.py -f $file_path imageinfo | grep "Suggested Profile" | cut -d "(" -f3 | cut -d " " -f3 | cut -d ")" -f1 2> /dev/null)


for pid in $(python2.7 /opt/volatility/vol.py -f $file_path --profile=$profile pslist 2>/dev/null | sed "s/  / /g" |  sed "s/  / /g" |  sed "s/  / /g" |  sed "s/  / /g" |  sed "s/  / /g" |  sed "s/  / /g" | cut -d " " -f3 | egrep -v "PID|-" | sort | uniq)
do python2.7 /opt/volatility/vol.py -f $file_path --profile=$profile malfind -p $pid 2>/dev/null | egrep "^0x|Process|Vad|Flags" && echo ""
done
