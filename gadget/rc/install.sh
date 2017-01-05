#!/bin/sh
cp pyreboot /etc/init.d
cp pychange /etc/init.d
chmod 755 /etc/init.d/pyreboot
chmod 755 /etc/init.d/pychange
update-rc.d pyreboot defaults
update-rc.d pychange defaults
