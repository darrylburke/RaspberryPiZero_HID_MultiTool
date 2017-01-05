#!/bin/sh
OS=$1
CURRENT=`cat current`
(cd $CURRENT;./stop.sh)
cp serial/config.txt /boot
cp serial/cmdline.txt /boot
(cd serial;./start.sh)

