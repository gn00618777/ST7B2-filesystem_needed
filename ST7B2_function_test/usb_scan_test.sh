#!/bin/bash

echo "$1"

for (( i=0; i<$1; i=i+1 ))
do
        usbx=`lsblk | grep "sda"`
        usby=`lsblk | grep "sdb"`

        if [ "$usbx" != "" ] && [ "$usby" != "" ]; then

             # mount usbx
             mount /dev/sda1 /media

             # mount usby
             mount /dev/sdb1 /mnt

             echo "Bernie" > /media/sda_text
	     echo "Bernie" > /mnt/sdb_text

             printresultx=`cat /media/sda_text`
             printresulty=`cat /mnt/sdb_text`

             if [ "$printresultx" == "Bernie" ]; then
		  echo "sda read data is correct!"	
      fi
             if [ "$printresulty" == "Bernie" ]; then
                  echo "sdb read data is correct!"
	     fi

             #umount usbx
             umount /media

	     #umount usby
             umount /mnt

         fi

         if [ "$usbx" != "" ] && [ "$usby" == "" ]; then


	    #mount usbx
            mount /dev/sda1 /meida

            echo "Bernie" > /media/sda_text

            printresultx=`cat /media/sda_text`

            if [ "$printresultx" == "Bernie" ]; then
		echo "sda read data is correct!"
    fi

            #umount usbx
            umount /media
	
         fi

         if [ "$usbx" == "" ] && [ "$usby" != "" ]; then

             #mount usby
             mount /dev/sdb1 /mnt

             echo "Bernie" > /mnt/sdb_text

             printresulty=`cat /mnt/sdb_text`

             if [ "$printresulty" == "Bernie" ]; then
                  echo "sdb read data is correct!"
             fi

             #umount usby
             umount /mnt
         fi

         if [ "$usbx" == "" ] && [ "$usby" != "" ]; then
              break
         fi

         echo "Cycle $i done"
         sleep 1
done

          echo "====Exit Test======"
