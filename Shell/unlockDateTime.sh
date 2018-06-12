#!/bin/bash

################################################################################################################
#   unlockDateTime.sh
#   Lock or unlock the security restriction for standard users' ability to change date/time preferences
#   https://github.com/amoscaritola
#   2017
################################################################################################################
#
#   Set parameter 4 in JSS:
#   lock - limits access to admins only
#   unlock - allows standard users to make changes
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
elif [ "$setValue" == "unlock" ];then
	echo "Allow standard users to change date/time"
	security authorizationdb write system.preferences allow
	security authorizationdb write system.preferences.datetime allow
  exit 0
elif [ "$setValue" == "lock" ];then
	echo "Removing standard user access to date/time"
	security authorizationdb write system.preferences admin
	security authorizationdb write system.preferences.datetime admin
  exit 0
else
	echo "set value as unlock or lock only"
	exit 1
fi
