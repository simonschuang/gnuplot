#!/bin/bash

logfile=/var/log/gpupower.log
timestemp=$(date '+%Y%m%d %T')
power=$(nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits | tr "\n" " ")
echo ${timestemp} ${power} >> ${logfile}
