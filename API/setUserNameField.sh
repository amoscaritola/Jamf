#!/bin/bash

######################################################################################################
#   setUserNameField.sh
#   Sets the username field in the JSS for the device with the username of the current logged in user
#   https://github.com/amoscaritola
#   03.14.2018
#######################################################################################################

server="https://your.jss.server:8443" # JSS URL
username="$4" # JSS username with API privileges - Parameter 4 in JSS
password="$5" # Password for the JSS account - Parameter 5 in JSS

currentUser=$(stat -f%Su /dev/console)

macSerial=$(system_profiler SPHardwareDataType | grep Serial | awk '{ print $4 }')

curl -k -s -H "Content-Type: application/xml" -u ${username}:${password} ${server}/JSSResource/computers/serialnumber/$macSerial -d "<computer><location><username>$currentUser</username></location></computer>" -X PUT

exit 0
