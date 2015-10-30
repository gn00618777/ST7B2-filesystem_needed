#!/bin/sh

COLOR_REST='\e[0m'
COLOR_YELLOW='\e[0;33m';
COLOR_GREEN='\e[0;32m';

if [ "$1" == "" ]; then

   str=`iw dev wlan0 scan | grep "SSID"`
   echo -e "${COLOR_GREEN}$str${COLOR_REST}"
   sleep 1
   exit 0

fi

if [ "$1" == "c" ]; then

   if [ "$2" == "" ]; then

      echo -e "${COLOR_YELLOW}Usage: ./wifi_test.sh c <SSID> -->To check this SSID existed or not${COLOR_REST}"      
      exit 0

   fi

   str=`iw dev wlan0 scan | grep "SSID" | grep "\b$2\b"`

   if [ "$str" != "" ]; then

      echo -e "${COLOR_YELLOW} $2 is exist ${COLOR_REST}"

   else

      echo -e "${COLOR_YELLOW} $2 is not exist ${COLOR_REST}"

   fi

   exit 0

fi


if [ "$1" == "s" ]; then

   if [ "$2" == "" ] || [ "$3" == "" ]; then

      echo -e "${COLOR_YELLOW}Usage: ./wifi_test.sh s '\"<SSID>\"' '\"<password>\"' -->Setting SSID & password ${COLOR_REST}"

      exit 1

   fi

   id=`wpa_cli -i wlan0 add_network`
   wpa_cli -i wlan0 set_network $id ssid $2
   sleep 1
   wpa_cli -i wlan0 set_network $id psk $3
   sleep 1
   wpa_cli -i wlan0 list_network
   echo -e "${COLOR_YELLOW}Now you can select id of network. For example: ./wifi_enable.sh select <id>${COLOR_REST}"
   exit 0
fi

if [ "$1" == "select" ]; then

   if [ "$2" == "" ]; then

      echo -e "${COLOR_YELLOW}Usage: ./wifi_enable.sh select <id> --> Selecting id of available network you want to connect and then get IP${COLOR_REST}"
      exit 1

   fi

   wpa_cli -i wlan0 select_network $2
   udhcpc -i wlan0
   exit 0

fi

if [ "$1" == "list" ]; then

   if [ "$2" != "" ]; then

        echo -e "${COLOR_YELLOW}Usage: ./wifi_test.sh list --> Listing available network${COLOR_REST}"
        exit 1

   fi

   wpa_cli -i wlan0 list_network
   exit 0

fi

if [ "$1" == "save" ]; then

   if [ "$2" != "" ]; then

      echo -e "${COLOR_YELLOW}Usage: ./wifi_test.sh save --> Saving configuration to /etc/wpa_supplicant.conf${COLOR_REST}"
      exit 1

   fi

   wpa_cli -i wlan0 save_config
   exit 0

fi

if [ "$1" == "disconnect" ]; then

   if [ "$2" != "" ]; then

      echo -e "${COLOR_YELLOW}Usage: ./wifi_test.sh disconnect --> Disconnecting from current network${COLOR_REST}" 
      exit 1

   fi

   wpa_cli -i wlan0 disconnect
   exit 0

fi

if [ "$1" == "reconnect" ]; then

   if [ "$2" != "" ]; then

      echo -e "${COLOR_YELLOW}Usage: ./wifi_test reconnect --> Reconnecting form current network${COLOR_REST}" 

   fi

   wpa_cli -i wlan0 reconnect
   exit 0

fi

if [ "$1" == "disable" ]; then

   if [ "$2" == "" ]; then

      echo -e "${COLOR_YELLOW}Usage: ./wifi_test.sh disable <id> --> Diable id of network${COLOR_REST}"
      exit 1

   fi

   wpa_cli -i wlan0 disable_network $2
   exit 0

fi

if [ "$1" == "enable" ]; then

   if [ "$2" == "" ]; then

      echo -e "${COLOR_YELLOW}Usgae: ./wifi_test.sh enable <id> --> Enable id of network${COLOR_REST}"
      exit 1

   fi

   wpa_cli -i wlan0 enable_network $2
   exit 0

fi

if [ "$1" == "reconfigure" ]; then

   if [ "$2" != "" ]; then

      echo -e "${COLOR_YELLOW}Usage: ./wifi_test.sh reconfigure --> Reapply /etc/wpa_supplicant.conf${COLOR_REST}"
      exit 1

   fi

   wpa_cli -i wlan0 reconfigure
   exit 0

fi

if [ "$1" == "status" ]; then

   if [ "$2" != "" ]; then

     echo -e "${COLOR_YELLOW}Usage: ./wifi_test.sh status --> Showing connection status${COLOR_REST}"
     exit 1

   fi

   wpa_cli -i wlan0 status
   exit 0

fi

if [ "$1" != "s" ]; then

   echo -e "${COLOR_YELLOW}Usage: ./wifi_test.sh --> Searching & Listing all available AP${COLOR_REST}"
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh s '\"<SSID>\"' '\"<password>\"' --> Setting SSID & password to new network${COLOR_REST}"
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh c <SSID> --> To check this SSID existed${COLOR_REST}"
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh select <id> --> Selectig id of available network you want to connect and then get IP${COLOR_REST}"
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh remove <id> --> Removing available network${COLOR_REST}"
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh list --> Listing all of available network${COLOR_REST}"
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh save --> Saving configuration to /etc/wpa_supplicant.conf${COLOR_REST}"
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh disconnect --> Disconnecting from current network${COLOR_REST}"
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh reconnect --> Reconnecting from current network${COLOR_REST}"
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh disable <id> --> Disabling id of network ${COLOR_REST}"
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh eable <id> --> Enabling id of network${COLOR_REST}"
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh reconfigure --> Reapply /etc/wpa_supplicant.conf${COLOR_REST}" 
   echo -e "${COLOR_YELLOW}       ./wifi_test.sh status --> Showing connection status${COLOR_REST}"
   exit 1

fi
