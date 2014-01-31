#!/bin/bash
set -e

EXAMPLES=$PWD/examples

if [[ ! -d "$ARDUINO_PATH" && -f "/usr/bin/arduino" ]]; then
  ARDUINO_PATH=/usr/bin
fi

function example {
  if [[ -f "$ARDUINO_PATH/arduino" ]]; then
    cd $ARDUINO_PATH
    echo
    echo "### Verifying example $1 on board $2"
    echo "Using $ARDUINO_PATH/arduino"
    xvfb-run ./arduino --board "$2" --verify "$EXAMPLES/$1/$1.ino"
    sleep 1
  else
    echo "Set ARDUINO_PATH to the folder containing the arduino binary"
    exit 1
  fi
}

for board in "arcore:avr:leonardo" "arcore:avr:leonardo2" "arcore:avr:micro"
do
  example "Empty" $board
  example "MidiEcho" $board
done

