#!/bin/bash

if [ ! -d "$1" ]; then
  echo "Usage: $0 <path-to-target-directory>";
  exit 1;
fi

if [ -d "${1}/.git" ]; then
  echo "error: target directory seems to be a git repository. aborting...";
  exit 1;
fi

INTERVAL=2

echo "Syncing directory content every ${INTERVAL}s to $1"
while [ true ]; do
  echo -n ".";
  rsync -a --exclude '.git' --exclude '.gitignore' --exclude '.npmignore' --exclude '.watchmanconfig' --exclude 'node_modules' --exclude 'android/build' --exclude '.idea' --exclude 'android/.idea' . $1
  sleep ${INTERVAL};
done;
