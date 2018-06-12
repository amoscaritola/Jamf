#!/bin/bash

################################################################################################################
#   selfServiceAppPermissions.sh
#   Fixes permissions on Self Service.app so the application icon will switch properly to branded version.
#   https://github.com/amoscaritola
#   03/25/2018
################################################################################################################

selfService="/Applications/Self Service.app"

if [ -d "$selfService" ]; then
    chmod 775 /Applications/Self\ Service.app
    echo "Self Service Permissions Repaired"
else
    echo "Self Service not installed, no action performed"
fi
exit 0
