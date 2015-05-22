#!/bin/bash

COLOR_REST='\e[0m'
COLOR_YELLOW='\e[0;33m';

# set NAT needed files
echo "cp NAT/eth1_nat.sh to /usr/sbin"
cp NAT/eth1_nat.sh /usr/sbin
echo "cp NAT/udhcpd_eth1.conf to /etc"
cp NAT/udhcpd_eth1.conf /etc

# set 3G needed files
test -d /etc/ppp/peers
if [ "$?" == "0" ]; then
     echo "cp 3G/* to /etc/ppp/peers"
     cp 3G/* /etc/ppp/peers
else
    echo -e "${COLOR_YELLOW}Yout should install ppp package first${COLOR_REST}"
fi

# set CAN bus needed binaries
echo "cp canbus_binarys/canconfig to /usr/sbin"
cp canbus_binarys/canconfig /usr/sbin
echo "cp canbus_binarys/candump to /usr/bin"
cp canbus_binarys/candump /usr/bin
echo "cp canbus_binarys/canecho to /usr/bin"
cp canbus_binarys/canecho /usr/bin
echo "cp canbus_binarys/cansend to /usr/bin"
cp canbus_binarys/cansend /usr/bin
echo "cp canbus_binarys/cansequence to /usr/bin"
cp canbus_binarys/cansequence /usr/bin

# set openvpn needed files
test -d /etc/openvpn
if [ "$?" == "0" ]; then
     mkdir -p /etc/openvpn/easy-rsa
     mkdir -p /etc/openvpn/servers/server/ccd
     cp -r /usr/share/doc/openvpn/examples/easy-rsa/2.0/* /etc/openvpn/easy-rsa/
     echo "cp openvpn/* to /etc/openvpn"
     cp openvpn/* /etc/openvpn
else
    echo -e "${COLOR_YELLOW}You should install openvpn package first${COLOR_REST}"
fi

# set detectWAN & bring up netinterfaces scripts
echo "cp boot_setting/* to /home/ubuntu"
cp boot_setting/* /home/ubuntu

# set wifi needed .ko & firmwares
mkdir -p /home/ubuntu/wl18xx
mkdir -p /lib/firmware/ti-connectivity

echo "cp WG7833_modules/compat.ko to /home/ubuntu/wl18xx"
cp WG7833_modules/compat.ko /home/ubuntu/wl18xx
echo "cp WG7833_modules/cfg80211.ko to /home/ubuntu/wl18xx"
cp WG7833_modules/cfg80211.ko /home/ubuntu/wl18xx
echo "cp WG7833_modules/mac80211.ko to /home/ubuntu/wl18xx"
cp WG7833_modules/mac80211.ko /home/ubuntu/wl18xx
echo "cp WG7833_modules/wlcore.ko to /home/ubuntu/wl18xx"
cp WG7833_modules/wlcore.ko /home/ubuntu/wl18xx
echo "cp WG7833_modules/wl18xx.ko to /home/ubuntu/wl18xx"
cp WG7833_modules/wl18xx.ko /home/ubuntu/wl18xx
echo "cp WG7833_modules/wlcore_sdio.ko to /home/ubuntu/wl18xx"
cp WG7833_modules/wlcore_sdio.ko /home/ubuntu/wl18xx

echo "cp firmwares/* /lib/firmware/ti-connectivity"
cp WG7833_modules/firmwares/* /lib/firmware/ti-connectivity

# set test scripts for ST7B2
mkdir -p /home/ubuntu/ST7B2_function_test
echo "cp ST7B2_function_test/wifi_test.sh to /home/ubuntu/ST7B2_function_test"
cp ST7B2_function_test/wifi_test.sh /home/ubuntu/ST7B2_function_test
echo "cp ST7B2_function_test/rtc_test.sh to /home/ubuntu/ST7B2_function_test"
cp ST7B2_function_test/rtc_test.sh /home/ubuntu/ST7B2_function_test
echo "cp ST7B2_function_test/led_test.sh to /home/ubuntu/ST7B2_function_test"
cp ST7B2_function_test/led_test.sh /home/ubuntu/ST7B2_function_test
echo "cp ST7B2_function_test/extend_gpio.sh to /home/ubuntu/ST7B2_function_test"
cp ST7B2_function_test/extend_gpio.sh /home/ubuntu/ST7B2_function_test
echo "cp ST7B2_function_test/canbus_test.sh to /home/ubuntu/ST7B2_function_test"
cp ST7B2_function_test/canbus_test.sh /home/ubuntu/ST7B2_function_test
echo "cp ST7B2_function_test/3g_test.sh to /home/ubuntu/ST7B2_function_test"
cp ST7B2_function_test/3g_test.sh /home/ubuntu/ST7B2_function_test
