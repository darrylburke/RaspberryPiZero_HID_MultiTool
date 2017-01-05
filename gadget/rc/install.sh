#!/bin/sh
cp pyreboot /etc/init.d
cp pychange /etc/init.d
update-rc.d pyreboot defaults
update-rc.d pychange defaults
