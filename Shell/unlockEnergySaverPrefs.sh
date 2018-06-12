#!/bin/bash

################################################################################################################
#   unlockEnergySaverPrefs.sh
#   Lock or unlock the security restriction for standard users' ability to change energy saver preferences
#   https://github.com/amoscaritola
#   2017
################################################################################################################
#
#   Set parameter 4 in JSS:
#   disable - limits access to admins only
#   enable - allows standard users to make changes
#
#   If you do not want to set the value in the JSS you can hardcode the value below.
################################################################################################################
#   HARDCODE VALUE HERE
setValue=""
################################################################################################################

# Check for hardcoded value, if it is blank, set the value to $4
setValue=${setValue:-$4}
if [ "$setValue" == "" ];then
	echo "Value is blank. Set value in parameter 4 of JSS or hardcode value in script."
	exit 1
elif [ "$setValue" == "enable" ];then
	echo "Allow standard users to change energy saver preferences"
	security authorizationdb write system.preferences allow
	security authorizationdb write system.preferences.energysaver allow
  exit 0
elif [ "$setValue" == "disable" ];then
	echo "Removing access to energy saver"
	security authorizationdb write system.preferences admin
	security authorizationdb write system.preferences.energysaver admin
  exit 0
else
	echo "set value as enable or disable only"
	exit 1
fi
