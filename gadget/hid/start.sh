#!/bin/bash
OS=$1
echo "Setting HID for [ $OS ]"
echo "hid" > /root/gadget/current
echo "dwc2" >> /etc/modules
echo "g_hid" >> /etc/modules
echo "libcomposite" >> /etc/modules
if [ "$OS" == "linux" ]; then
 cp youtube.dd /boot/payload.dd
fi
echo "/root/gadget/rc.sh" >> /etc/rc.local
