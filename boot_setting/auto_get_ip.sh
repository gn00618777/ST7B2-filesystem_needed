#!/bin/bash

getip() {

    dhclient eth1 &> /dev/null

}

declare -i x=0

while [ "$x" -le 5 ]
do
      sleep 1

      str=`ifconfig eth1 | grep "inet addr"`

       if [ "$str" == "" ]; then

            getip &

       else

           exit 0

       fi

      count=`ps aux | grep -c "dhclient"`

      if [ "$count" -gt "5" ]; then

           killall dhclient &> /dev/null

      fi

done
