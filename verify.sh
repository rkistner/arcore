#!/bin/bash
set -e

EXAMPLES=$PWD/examples

if [[ ! -d "$ARDUINO_PATH" && -f "/usr/bin/arduino" ]]; then
  ARDUINO_PATH=/usr/bin
fi

function example {
  if [[ -f "$ARDUINO_PATH/arduino" ]]; then
    echo "Using $ARDUINO_PATH/arduino"
    cd $ARDUINO_PATH
    xvfb-run ./arduino --board arcore:avr:leonardo --verify "$EXAMPLES/$1/$1.ino"
    sleep 1
  else
    echo "Set ARDUINO_PATH to the folder containing the arduino binary"
    exit 1
  fi
}

example "Empty"
example "MidiEcho"

