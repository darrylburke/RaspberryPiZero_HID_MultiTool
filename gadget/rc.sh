#!/bin/bash
STATE=`cat /root/gadget/current`
OS=`/root/gadget/checkos.py`
echo "S=$STATE"
if [ "$STATE" = "hid" ];then
	(cd /root/gadget/hid;./mkdevice.sh)
	/sbin/modprobe g_hid
	sleep 3
	mount -t vfat /root/gadget/storage/piusb.bin /usbmnt
	if [ "$OS" = "linux" ];then
		cp /usbmnt/linux /root/gadget/hid/payload.dd
	fi
	if [ "$OS" = "windows" ];then
		cp /usbmnt/windows /root/gadget/hid/payload.dd
	fi
	if [ "$OS" = "ios" ];then
		cp /usbmnt/ios /root/gadget/hid/payload.dd
	fi

	sleep 1
	tr -d '\r' < /root/gadget/hid/payload.dd > /root/gadget/hid/payload2.dd
	sleep 1
	/root/gadget/hid/duckpi.sh /root/gadget/hid/payload2.dd
	umount /usbmnt
fi
if [ "$STATE" = "storage" ];then
	#/sbin/modprobe g_multi file=/root/gadget/storage/piusb.bin
	/sbin/modprobe g_mass_storage file=/root/gadget/storage/piusb.bin
	sleep 3
fi
