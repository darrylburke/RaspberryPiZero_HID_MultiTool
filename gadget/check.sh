#!/bin/sh
CURRENT=`cat current`
NEW=`python checkfunction.py`
OS=`python checkos.py`
if [ "$CURRENT" != "$NEW" ];then
echo "OLD:[ $CURRENT ] NEW:[ $NEW ] OS:[ $OS] "
fi
