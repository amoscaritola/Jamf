#!/bin/bash

#############################################################################################################
#	lowercaseComputerName.sh
#	Gets the computer name from the JSS using parameter 2, makes it lowercase then renames the computer.
#	https://github.com/amoscaritola
#	3.14.18
##############################################################################################################

#Getting computer name from JSS
computerName="$2"

#Make computer name lowercase
fixedName=$(echo "$computerName" | awk '{print tolower($0)}')

#Rename computer
/usr/sbin/scutil --set ComputerName "$fixedName"
/usr/sbin/scutil --set LocalHostName "$fixedName"
/usr/sbin/scutil --set HostName "$fixedName"

#echo results
echo "Computer name changed from $computerName to $fixedName"

exit 0