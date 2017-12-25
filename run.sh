#!/bin/bash

lighttpd -D -f /etc/lighttpd/lighttpd.conf &

while true; do
	/opt/gpufanlog.sh
	/opt/gpumemusedlog.sh
	/opt/gpupowerlog.sh
	/opt/gputemplog.sh
	/opt/graph.sh
	sleep 60
done
