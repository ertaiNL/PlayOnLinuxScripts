#!/bin/bash
# Date : (2017-08-11 16:50)
# Last Revision : (2017-08-11 16:50)
# Wine Version used : 2.13
# Distribution used to test : Ubuntu 16.04
# Author: ertaiNL
# Script license : GPL v2
# Programm license : Retail
# Depend : CivilizationII

[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"

TITLE_BASE="Civilization II"
TITLE="Civilization II Scenarios"
PREFIX="CivilizationII"
PUBLISHER="Microprose"
AUTHOR="ErtaiNL"
WORKING_WINE_VERSION="2.13"
CD_PATH="civ2"
CD_INSTALL_FILE="setup.exe"
CD_CHECK="data.z"

POL_SetupWindow_Init

POL_SetupWindow_presentation "$TITLE" "$PUBLISHER" "$PUBLISHER_URL" "$AUTHOR" "$PREFIX"

POL_SetupWindow_cdrom
POL_SetupWindow_check_cdrom "$CD_CHECK"

if [ "$(POL_Wine_PrefixExists "$PREFIX")" = "False" ]
then
  POL_Debug_Fatal "$TITLE won't work without $TITLE_BASE installed with the corresponding script"
fi

POL_Wine_SelectPrefix "$PREFIX"

# Check the disc again since the user could have removed it at this point
POL_SetupWindow_check_cdrom "$CD_CHECK"
POL_Wine start /unix "$CDROM/$CD_INSTALL_FILE"
POL_Wine_WaitExit

POL_SetupWindow_Close
exit 0
