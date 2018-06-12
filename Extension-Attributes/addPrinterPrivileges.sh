#!/bin/sh

################################################################################################################
#   Extension Attribute
#   addPrinterPrivileges.sh
#   Displays if standard users can add printers or if Admin authentication is required.
#   https://github.com/amoscaritola
#   2017
################################################################################################################

everyoneGroup=`/usr/bin/dscl . read /Groups/everyone GeneratedUID | sed 's/GeneratedUID: //g'`
result=`/usr/bin/dscl . read /Groups/lpadmin | grep $everyoneGroup`

if [ "$result" == "" ]; then
  echo "<result>Fail (Admin authentication required.)</result>"
else
  echo "<result>Pass (Standard users can add printers.)</result>"
fi
exit 0