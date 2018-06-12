#!/bin/bash

################################################################################################################
#   wifiRestriction.sh
#   Require admin authorization to: Create computer-to-computer networks, Change networks, Turn Wi-Fi on or off
#   https://github.com/amoscaritola
#   February 28, 2017
################################################################################################################
#
#   Set parameter 4 in JSS to:
#   yes - limits access to admins only
#   no - allows standard users to make changes
#
#   If you do not want to set the value in the JSS you can hardcode the value below.
################################################################################################################
#   Hardcode value here
setValue=""
################################################################################################################

# Check for hardcoded value, if it is blank, set the value to $4
setValue=${setValue:-$4}
if [ "$setValue" == "" ];then
  echo "Value is blank. Set value in parameter 4 of JSS or hardcode value in script."
  exit 1
elif [ "$setValue" == "yes" ];then
  echo "Admin authorization now required to change network settings"
  /usr/libexec/airportd prefs RequireAdminIBSS=YES RequireAdminNetworkChange=YES RequireAdminPowerToggle=YES
  exit 0
elif [ "$setValue" == "no" ];then
  echo "Admin authorization is no longer required to change network settings"
  /usr/libexec/airportd prefs RequireAdminIBSS=NO RequireAdminNetworkChange=NO RequireAdminPowerToggle=NO
  exit 0
else
  echo "incorrect value set, please set value as yes or no only"
  exit 1
fi
