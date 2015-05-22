#!/bin/bash

COLOR_REST='\e[0m'
COLOR_YELLOW='\e[0;33m';

if [ "$1" == "" ]; then

   str=`ifconfig | grep "can0"`

   if [ "$str" == "" ]; then

      echo "Bring up CAN bus interface...."
      sleep 2
      canconfig can0 bitrate 50000 ctrlmode triple-sampling on
      canconfig can0 start

      str1=`ifconfig | grep "can0"`

      if [ "$str1" != "" ]; then

         echo "CAN bus is ready!"
         exit 0

      else

         echo "Can bus is not ready!"

      fi

      exit 0
   fi

   if [ "$str" != "" ]; then

      echo "CAN bus has already exist!"

   fi

fi

if [ "$1" == "down" ]; then

   str2=`ifconfig | grep "can0"`

   if [ "$str2" == "" ]; then

      echo "No CAN interface to be down"
      exit 0

   fi

   if [ "$str2" != "" ]; then

      canconfig can0 stop
      exit 0

   fi
 
   exit 0
fi

if [ "$1" != "" ] && [ "$1" != "down" ]; then

   echo -e "${COLOR_YELLOW}Usage: ./canbus_test.sh (Bring CAN up)${COLOR_REST}"
   echo -e "${COLOR_YELLOW}Usage: ./canbus_test.sh down (Bring CAN down)${COLOR_REST}"

fi

