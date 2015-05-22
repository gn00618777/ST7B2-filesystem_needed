#!/bin/bash

# bring up wlan0
echo "bring up wlan0 interface...\n"
insmod /home/ubuntu/wl18xx/compat.ko
insmod /home/ubuntu/wl18xx/cfg80211.ko
insmod /home/ubuntu/wl18xx/mac80211.ko
insmod /home/ubuntu/wl18xx/wlcore.ko
insmod /home/ubuntu/wl18xx/wl18xx.ko
insmod /home/ubuntu/wl18xx/wlcore_sdio.ko
ifconfig wlan0 up
#echo "wlan0 enabled done\n"
#echo "=================================\n"

# bring up eth1
#echo "bring up eth1 interface...\n"
ifconfig eth1 up
#dhclient eth1
#echo "eth1 enabled done\n"
#echo "=================================\n"

#bring up (3g)ppp0
#echo "bring up (3g)ppp0 interface...\n"
#pppd call wcdma &
#echo "ppp0 enabled done\n"
#echo "=================================\n"


eth1_nat.sh
cd /flask_web_demaon
python hello-template.py &

