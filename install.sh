#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  HARDWARE=~/Arduino/hardware
elif [[ "$OSTYPE" == "darwin"* ]]; then
  HARDWARE=~/Documents/Arduino/hardware  
else
  echo "OS not supported in install script, manually symlink or copy arcore to your Arduino IDE's hardware folder."
  exit
fi
TARGET=$HARDWARE/arcore
mkdir -p $HARDWARE
if [[ -d "$TARGET" ]]; then
  echo "Already installed at $TARGET"
else
  ln -s "$PWD" "$TARGET"
  echo "Installed at $TARGET"
fi

