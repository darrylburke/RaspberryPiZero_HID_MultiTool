#!/bin/sh
CURRENT=`cat current`
NEW=`python checkfunction.py`
OS=`python checkos.py`
DATE=`date`
if [ "$CURRENT" != "$NEW" ];then
# echo ./$NEW.sh $OS
echo "$DATE OLD:[ $CURRENT ] NEW:[ $NEW ] OS:[ $OS] " | tee -a /tmp/change
 ./$NEW.sh $OS
 reboot
fi
