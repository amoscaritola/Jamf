#!/bin/bash

##########################################################################################################
#   diskType.sh                                                                                          #
#   Extension attribute that will list the types of drives in the Mac as well as if Fusion is set up.    #
#   https://github.com/amoscaritola                                                                      #
#   March 15, 2018                                                                                       #
##########################################################################################################

echo -n "<result>"
diskutil info -all | grep "Solid State" | awk '{ print $3 }' | sort | uniq | sed 's/Yes/SSD/g' | sed 's/No/HDD/g'
diskutil info -all | grep "Fusion Drive" | awk '{ print $3 }' | sort | uniq | sed 's/Yes/Fusion/g' | sed 's/No//g'
echo "</result>"
