#!/bin/bash
set -e

EXAMPLES=$PWD/examples
ARDUINO="not found"

if [[ ! -d "$ARDUINO_PATH" && -f "/usr/bin/arduino" ]]; then
  ARDUINO_PATH=/usr/bin
fi

function example {
  if [[ -d "$ARDUINO_PATH" ]]; then
    echo "Using $ARDUINO_PATH/arduino"
    cd $ARDUINO_PATH
    xvfb-run ./arduino --verify "$EXAMPLES/$1/$1.ino"
  else
    echo "Set $ARDUINO_PATH to the folder containing the arduino binary"
  fi
}

example "empty"

