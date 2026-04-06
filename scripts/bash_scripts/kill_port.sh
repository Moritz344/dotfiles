#!/bin/bash

PORT="$1"
if [ -z $PORT ]; then 
  echo "No port specifid."
  exit
fi
PID=$(fuser $PORT/tcp 2>/dev/null)

if [ -n "$PID" ]; then 
  echo "Killed $PID"
  kill $PID
else 
  echo "Nothing to do."
fi
