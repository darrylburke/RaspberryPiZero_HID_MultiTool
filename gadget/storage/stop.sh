#!/bin/sh
cat /etc/modules | egrep -v "^dwc2$|^g_mass_storage$" > /tmp/modules
cp /tmp/modules /etc/modules
#cat /etc/rc.local | grep -v rc.sh > /tmp/rc.local
#cp /tmp/rc.local /etc/rc.local
