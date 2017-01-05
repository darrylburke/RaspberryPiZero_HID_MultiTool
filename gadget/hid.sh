#!/bin/sh
OS=$1
CURRENT=`cat current`
(cd $CURRENT;./stop.sh)
cp hid/config.txt /boot
cp hid/cmdline.txt /boot
(cd hid;./start.sh $OS)

