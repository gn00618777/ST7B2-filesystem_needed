#!/bin/bash

COLOR_REST='\e[0m'
COLOR_YELLOW='\e[0;33m';

str=`dmesg | grep "ttyUSB0"`

if [ "$1" == "" ]; then

   if [ "$str" != "" ]; then

      echo "3G module is OK!"
      exit 0

   else

      echo "3G module maybe is not install appropriately "
      exit 0
 
   fi

fi

if [ "$1" != "" ]; then

   echo -e "${COLOR_YELLOW}Usage: ./3g_test.sh ${COLOR_REST}"

fi
