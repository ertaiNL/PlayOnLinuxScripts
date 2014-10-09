#!/bin/bash
# Date : (2014-10-10 18:32)
# Last Revision : (2014-10-10 22:07)
# Wine Version used : 1.4.1
# Distribution used to test : Ubuntu 14.04
# Author: Ertai
# Script license : GPL v2
# Programm license : Retail
# Depend :
 
[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"
 
TITLE="Stronghold Crusader"
PREFIX="StrongholdCrusader"
WORKING_WINE_VERSION="1.6.2-scummvm_support"
CD_FILE_TO_CHECK="disk1/Stronghold Crusader.exe"
CD_INSTALL_FILE="disk1/Setup.exe"

POL_SetupWindow_Init
 
POL_SetupWindow_presentation "$TITLE" "Firefly Studios" "http://www.fireflyworlds.com/" "Ertai" "$PREFIX"

POL_SetupWindow_cdrom
POL_SetupWindow_check_cdrom "$CD_FILE_TO_CHECK"

POL_Wine_SelectPrefix "$PREFIX"
POL_Wine_PrefixCreate "$WORKING_WINE_VERSION"
 
# Check the disc again since the user could have removed it at this point
POL_SetupWindow_check_cdrom "$CD_FILE_TO_CHECK"
POL_Wine start /unix "$CDROM/$CD_INSTALL_FILE"
POL_Wine_WaitExit
 
POL_Shortcut "Stronghold Crusader.exe" "Stronghold Crusader"
 
POL_SetupWindow_Close
exit 0
