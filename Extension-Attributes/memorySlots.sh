#!/bin/bash

##########################################################################################################
#   Extension Attribute
#   memorySlots.sh
#   Extension attribute that will list the the size of the memory in each slot. If there is not memory 
#	in a slot it will display "Empty"
#   https://github.com/amoscaritola
#   March 15, 2018                                                                                       
##########################################################################################################

echo "<result>`system_profiler SPMemoryDataType | grep "Size" | sed "s/^[ \t]*//" | awk '{print $2 " " $3}'`</result>"