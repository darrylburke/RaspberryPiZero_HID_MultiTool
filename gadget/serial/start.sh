#!/bin/sh
sudo systemctl enable getty@ttyGS0.service
echo "serial" > /root/gadget/current
#reboot
