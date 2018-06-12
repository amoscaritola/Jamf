#!/bin/sh

################################################################################################################
#   Extension Attribute
#   resumePrinterPrivileges.sh
#   Displays if standard users can pause - resume printers or if Admin authentication is required.
#   https://github.com/amoscaritola
#   2017
################################################################################################################

everyoneGroup=`/usr/bin/dscl . read /Groups/everyone GeneratedUID | sed 's/GeneratedUID: //g'`
result=`/usr/bin/dscl . read /Groups/_lpoperator | grep $everyoneGroup`

if [ "$result" == "" ]; then
  echo "<result>Fail (Admin authentication required.)</result>"
else
  echo "<result>Pass (Users can Pause - Resume printers)</result>"
fi
exit 0
