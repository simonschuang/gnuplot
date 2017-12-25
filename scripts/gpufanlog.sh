#!/bin/bash

logfile=/var/log/gpufan.log
timestemp=$(date '+%Y%m%d %T')
fans=$(nvidia-smi --query-gpu=fan.speed --format=csv,noheader,nounits | tr "\n" " ")
echo ${timestemp} ${fans} >> ${logfile}
