#!/bin/bash

COLOR_YELLOW='\e[0;33m';
COLOR_REST='\e[0m'
COLOR_GREEN='\e[0;32m';

if [ "$1" == "wifi" ] && [ "$2" == "" ]; then
   
   echo "Turning off WIFI led...."
   echo "0" > /sys/class/gpio/gpio16/value
   sleep 5
   echo "Turning on WIFI led...." 
   echo "1" > /sys/class/gpio/gpio16/value

   exit 0

fi

if [ "$1" == "app" ] && [ "$2" == "" ]; then 

   echo "Turning off APP led...."
   echo "0" > /sys/class/gpio/gpio17/value
   sleep 5
   echo "Turning on APP led...."
   echo "1" > /sys/class/gpio/gpio17/value

   exit 0

fi

if [ "$1" == "3g" ] && [ "$2" == "" ]; then

   echo "Turning off 3G led...."
   echo "0" > /sys/class/gpio/gpio15/value
   sleep 5
  echo -e "${COLOR_GREEN}Turning on 3G led will reboot system, would you want?${COLOR_REST}"
   read -p "Would you want? (y/n)" select
   if [ "$select" == "n" ] || [ "$select" == "N" ]; then
      
         echo "exit 3G led testing" 
         exit 0
   
   fi
 
   if [ "$select" == "y" ] || [ "$select" == "Y" ]; then
      
         echo "1" > /sys/class/gpio/gpio15/value

   fi

fi

if [ "$1" != "wifi" ] && [ "$1" != "app" ] && [ "$1" != "3g" ]; then

      echo -e "${COLOR_YELLOW}Usage: ./led_test.sh wifi${COLOR_REST}" 
      echo -e "${COLOR_YELLOW}Usage: ./led_test.sh app${COLOR_REST}"
      echo -e "${COLOR_YELLOW}Usage: ./led_test.sh 3g${COLOR_REST}"
    
      exit 0
fi

if [ "$2" != "" ]; then

     echo -e "${COLOR_YELLOW}Usage: ./led_test.sh wifi${COLOR_REST}"
     echo -e "${COLOR_YELLOW}Usage: ./led_test.sh app${COLOR_REST}"
     echo -e "${COLOR_YELLOW}Usage: ./led_test.sh 3g${COLOR_REST}"
   
     exit 0

fi
