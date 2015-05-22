#!/bin/bash

COLOR_REST='\e[0m'
COLOR_YELLOW='\e[0;33m';

if [ "$1" == "" ]; then

   echo -e "${COLOR_YELLOW}System clock is:${COLOR_REST}"
   date
   exit 0

fi

if [ "$1" == "s" ] && [ "$2" != "" ] && [ "$3" != "" ] && [ "$4" != "" ] && [ "$5" != "" ] && [ "$6" != "" ]; then

   echo -e "${COLOR_YELLOW}System clock is:${COLOR_REST}"
   date $2$3$4$5$6
   if [ "$?" == "0" ]; then

      hwclock -w -f /dev/rtc1
      echo -e "${COLOR_YELLOW}Now you can reboot & execute ./rtc_test.sh to check systm clock${COLOR_REST}"
      exit 0
   fi

else

   echo -e "${COLOR_YELLOW}usage: ./rtc_test.sh s 05 05 11 00 2015 (eg. month day hour minute year)${COLOR_REST}"
   exit 1


fi







