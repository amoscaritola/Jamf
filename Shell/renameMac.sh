#!/bin/sh

####################################################################################################
#	renameMac.sh
#	Renames the mac to the value set in parameter 4 of the JSS
#	https://github.com/amoscaritola
#	03/19/2018
####################################################################################################

# Set the computer name in parameter 4 of the JSS
computerName=$4

if [ "$computerName" != "" ]; then
	/usr/sbin/scutil --set ComputerName $computerName
	/usr/sbin/scutil --set LocalHostName $computerName
	/usr/sbin/scutil --set HostName $computerName
	echo "Computer Name successfully changed to $computerName"
	exit 0
else
	echo "No computer name set"
	exit 1
fi