#!/bin/bash
HARDWARE=~/Arduino/hardware
TARGET=$HARDWARE/arcore
mkdir -p $HARDWARE
if [[ -d "$TARGET" ]]; then
  echo "Already installed at $TARGET"
else
  ln -s "$PWD" "$TARGET"
  echo "Installed at $TARGET"
fi

