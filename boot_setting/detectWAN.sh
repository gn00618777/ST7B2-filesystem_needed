#!/bin/bash

i=1

while [ "$i" != "0" ]
do
   sleep 1
   sig=`dmesg | grep "PHY: 0:07 - Link is Up - 100/Full"`
   sig1=`dmesg | grep "PHY: 0:07 - Link is Up - 1000/Full"`
   if [ "$sig" != "" ] || [ "$sig1" != "" ]; then
      
         dhclient eth1 
         break

   fi

done
