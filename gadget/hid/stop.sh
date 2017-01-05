#!/bin/sh
cp backup/g_hid.ko /lib/modules/4.4.32+/kernel/drivers/usb/gadget/legacy
cat /etc/modules | egrep -v "^dwc2$|^g_hid$" > /tmp/modules
cp /tmp/modules /etc/modules
rm /boot/payload.dd
