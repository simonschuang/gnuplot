#!/bin/bash

# SIGTERM-handler
term_handler() {
  echo "Get SIGTERM"
  /etc/init.d/lighttpd stop
  kill -TERM "$child" 2> /dev/null
}

# setup handlers
trap term_handler SIGTERM
trap term_handler SIGKILL

run() {
    /etc/init.d/lighttpd start
    while true; do
	/opt/gpufanlog.sh
	/opt/gpumemusedlog.sh
	/opt/gpupowerlog.sh
	/opt/gputemplog.sh
	/opt/graph.sh
	sleep 60
    done
}

run &
child=$!
wait "$child"
