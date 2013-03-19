#!/bin/bash
set -e

EXAMPLES=$PWD/examples

if [[ ! -d "$ARDUINO_PATH" && -f "/usr/bin/arduino" ]]; then
  ARDUINO_PATH=/usr/bin
fi

function example {
  if [[ -d "$ARDUINO_PATH" ]]; then
    echo "Using $ARDUINO_PATH/arduino"
    cd $ARDUINO_PATH
    xvfb-run ./arduino --board arcore:avr:leonardo --verify "$EXAMPLES/$1/$1.ino"
    sleep 1
  else
    echo "Set $ARDUINO_PATH to the folder containing the arduino binary"
  fi
}

example "Empty"
example "MidiEcho"

