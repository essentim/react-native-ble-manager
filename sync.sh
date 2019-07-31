#!/bin/bash

if [ ! -d "$1" ]; then
  echo "Usage: $0 <path-to-target-directory>";
  exit 1;
fi

INTERVAL=2

echo "Syncing directory content every ${INTERVAL}s to $1"
while [ true ]; do
  echo -n ".";
  rsync -a --exclude 'node_modules' --exclude 'android/build' . $1
  sleep ${INTERVAL};
done;
