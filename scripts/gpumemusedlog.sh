#!/bin/bash

logfile=/var/log/gpumemused.log
timestemp=$(date '+%Y%m%d %T')
used=$(nvidia-smi --query-gpu=memory.used --format=csv,noheader,nounits | tr "\n" " ")
echo ${timestemp} ${used} >> ${logfile}
