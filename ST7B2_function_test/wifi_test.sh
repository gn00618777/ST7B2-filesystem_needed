#!/bin/bash

COLOR_REST='\e[0m'
COLOR_YELLOW='\e[0;33m';

if [ "$1" == "c" ]; then

   if [ "$2" == "" ]; then
      
      echo -e "${COLOR_YELLOW}Usage: ./wifi_test.sh c \"SSID\" -->To check this SSID existed${COLOR_REST}"      
      exit 0

   fi
 
   str=`iwlist wlan0 scan | grep "\b$2\b"`
   if [ "$str" != "" ]; then

      echo -e "${COLOR_YELLOW} $2 is exist ${COLOR_REST}"

   else

      echo -e "${COLOR_YELLOW} $2 is not exist ${COLOR_REST}"

   fi

   exit 0  

fi


if [ "$1" == "s" ]; then

   if [ "$2" == "" ] || [ "$3" == "" ]; then

      echo -e "${COLOR_YELLOW}Usage: ./wifi_test.sh s \"SSID\" \"password\" -->Setting SSID&password to get IP${COLOR_REST}"
  
      exit 1

   fi

   ifconfig wlan0 down
   sleep 3

   wpa_passphrase $2 $3 > /etc/wpa_supplicant/WIFI.conf
   wpa_supplicant -BDnl80211 -iwlan0 -c/etc/wpa_supplicant/WIFI.conf
   dhclient wlan0

   ifconfig wlan0 
   echo -e "${COLOR_YELLOW}Now you can check wlan0 interface whether getting IP address or not${COLOR_REST}"

fi

if [ "$1" != "s" ]; then

   echo -e "${COLOR_YELLOW}Usage: ./wifi_test.sh s \"SSID\" \"password\" -->Setting SSID&password to get IP${COLOR_REST}"
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh c \"SSID\" -->To check this SSID existed${COLOR_REST}"
   exit 1

fi


