#!/bin/sh
OS=$1
CURRENT=`cat current`
(cd $CURRENT;./stop.sh)
cp storage/config.txt /boot
cp storage/cmdline.txt /boot
echo "dwc2" >> /etc/modules
echo "g_mass_storage" >> /etc/modules
#echo "/root/gadget/rc.sh" >> /etc/rc.local
(cd storage;./start.sh)
