#!/bin/bash
STATE=`cat /root/gadget/current`
echo "S=$STATE"
if [ "$STATE" = "hid" ];then
	(cd /root/gadget/hid;./mkdevice.sh)
	/sbin/modprobe g_hid
	sleep 3
	cat /boot/payload.dd > /root/gadget/hid/payload.dd
	sleep 1
	tr -d '\r' < /root/gadget/hid/payload.dd > /root/gadget/hid/payload2.dd
	sleep 1
	/root/gadget/hid/duckpi.sh /root/gadget/hid/payload2.dd
fi
if [ "$STATE" = "storage" ];then
	#/sbin/modprobe g_multi file=/root/gadget/storage/piusb.bin
	/sbin/modprobe g_mass_storage file=/root/gadget/storage/piusb.bin
	sleep 3
fi
