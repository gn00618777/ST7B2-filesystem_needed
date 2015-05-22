#!/bin/bash

COLOR_REST='\e[0m'
COLOR_YELLOW='\e[0;33m';

str=`cat /sys/kernel/debug/gpio | grep "gpio-192"`
str1=`cat /sys/kernel/debug/gpio | grep "gpio-207"`


if [ "$1" == "" ] && [ "$str" != "" ] && [ "$str1" != "" ]; then

   echo "Extend gpios are OK!"
   exit 0

fi

if [ "$1" == "" ]; then

   if [ "$str" == "" ] || [ "$str1" == "" ]; then

      echo "Extend gpios are not ready"

   fi

   exit 0

fi

if [ "$1" != "" ]; then

   echo -e "${COLOR_YELLOW}Usage: ./extend_gpio.sh${COLOR_REST}"

fi
