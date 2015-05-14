#!/bin/bash

i=1

while [ "$i" != "0" ]
do
   sleep 1
   sig=`dmesg | grep "PHY: 0:07 - Link is Up - 100/Full"`
   if [ "$sig" != "" ]; then
      
         dhclient eth1 
         break

   fi

done
