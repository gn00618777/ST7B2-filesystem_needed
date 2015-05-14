#!/bin/bash

interface=`ifconfig -a | sed -n '16p' | sed 's/Link.*$//g'`
interface1=`ifconfig -a | sed -n '9p' | sed 's/Link.*$//g'`

ifconfig $interface up
sleep 1
ifconfig $interface1 up
sleep 1

str=`dmesg | grep "0x4dd072"`
str1=`dmesg | grep "id is : 0x0"`

if [ "$str" == "" ]; then
   
   echo "WAN port is failed"

else
  
   echo "WAN port is OK!"

fi 

if [ "$str1" == "" ]; then 

   echo "LAN port is failed"

else
 
   echo "LAN port is OK!"

fi   



      

   
 
