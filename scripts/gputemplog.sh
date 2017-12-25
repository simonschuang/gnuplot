#!/bin/bash

logfile=/var/log/gputemp.log
timestemp=$(date '+%Y%m%d %T')
temps=$(nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader | tr "\n" " ")
echo ${timestemp} ${temps} >> ${logfile}
