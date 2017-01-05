#!/bin/sh
OS=$1
CURRENT=`cat current`
(cd $CURRENT;./stop.sh)
cp normal/config.txt /boot
cp normal/cmdline.txt /boot
(cd normal;./start.sh)

