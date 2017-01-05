#!/bin/sh
OS=$1
CURRENT=`cat current`
(cd $CURRENT;./stop.sh)
cp ethernet/config.txt /boot
cp ethernet/cmdline.txt /boot
(cd ethernet;./start.sh)

