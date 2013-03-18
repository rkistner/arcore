#!/bin/sh
HARDWARE=~/Arduino/hardware
TARGET=$HARDWARE/arcode
mkdir -p $HARDWARE
ln -s `pwd` $TARGET
echo "Installed to $TARGET"

