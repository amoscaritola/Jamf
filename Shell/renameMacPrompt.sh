#!/bin/bash

##################################################################################
#	renameMacPrompt.sh
#	Prompts diaglogue box for user input. Changes computer name to user input text.
#	https://github.com/amoscaritola
#	03/19/2018
###################################################################################

#variables
macOS=$(sw_vers | grep ProductVersion | awk '{print $2}')
loggedInUser=$(stat -f%Su /dev/console)
loggedInUID=$(id -u "$loggedInUser")

#Display full OS
echo "Computer is running $macOS"

#Collecting the major OS Version
majorMacVersion=$(sw_vers -productVersion | awk -F '.' '{print $2}')

#Check if the macOS is less than or equal to 10.11
if [ "$majorMacVersion" -le 11 ]; then
	echo "macOS is less than or equal to 10.11"

	ComputerName=$(/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" "/usr/bin/osascript -e 'tell application \"System Events\" to set ComputerName to text returned of (display dialog \"Please Input New Computer Name\" default answer \"\" with icon 2)'")

else
	echo "macOS Greather than 10.11"
	
	ComputerName=$(/bin/launchctl asuser "$loggedInUID" sudo -iu "$loggedInUser" /usr/bin/osascript -e 'tell application "System Events" to set ComputerName to text returned of (display dialog "Please Input New Computer Name" default answer "" with icon 2)')
fi

/usr/sbin/scutil --set ComputerName  "$ComputerName"
/usr/sbin/scutil --set LocalHostName "$ComputerName"
/usr/sbin/scutil --set HostName "$ComputerName"

echo "Computer name set to $ComputerName"

exit 0