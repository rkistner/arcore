#!/bin/sh
HARDWARE=~/Arduino/hardware
TARGET=$HARDWARE/arcore
mkdir -p $HARDWARE
ln -s `pwd` $TARGET
echo "Installed to $TARGET"

