#!/bin/bash
# Date : (2015-10-18 22:18)
# Last Revision : (2015-10-20 00:07)
# Wine Version used : 1.6.2-scummvm_support
# Distribution used to test : Ubuntu 15.04
# Author: ertaiNL
# Script license : GPL v2
# Programm license : Retail
# Depend :

[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"

TITLE="Civilization II Test"
TITLE_MAPS="Civilization II Test Map editor"
PREFIX="CivilizationIITest"
PUBLISHER="Microprose"
AUTHOR="ErtaiNL"
WORKING_WINE_VERSION="1.6.2-scummvm_support"
STARTUP_FILE="civ2.exe"
STARTUP_FILE_MAPS="civ2map.exe"
CD_PATH="civ2"
CD_INSTALL_FILE="setup.exe"
CD2_CHECK="data.z"

WARNING_TEXT="There are a few parts of the installation that don't work correctly.
1. Sound of Civilization II isn't working in wine. So the sound-driver will be be disabled.
2. The installer of Civilization II will give the error
   'Unable to locate or run Program Manager'
   This warning can be ignored.
3. At the end of the installation of the basic game the 'Program Manager is still running. You need to close this."

POL_SetupWindow_Init

POL_SetupWindow_presentation "$TITLE" "$PUBLISHER" "$PUBLISHER_URL" "$AUTHOR" "$PREFIX"

POL_SetupWindow_message "$WARNING_TEXT" "$TITLE warnings"

POL_SetupWindow_cdrom
POL_SetupWindow_check_cdrom "$CD_PATH/$STARTUP_FILE"

POL_Wine_SelectPrefix "$PREFIX"
POL_Wine_PrefixCreate "$WORKING_WINE_VERSION"

# When you have enabled sound then Civilization II will crash. So we disable it in Wine so it doesn't
[ "$POL_OS" = "Linux" ] && POL_Wine_UpdateRegistryWinePair 'Drivers' 'Audio' ''

# Check the disc again since the user could have removed it at this point
# The basic game
POL_SetupWindow_check_cdrom "$CD_PATH/$STARTUP_FILE"
POL_Wine start /unix "$CDROM/$CD_INSTALL_FILE"
POL_Wine_WaitExit

POL_Shortcut "$STARTUP_FILE" "$TITLE"
POL_Shortcut "$STARTUP_FILE_MAPS" "$TITLE_MAPS"

#Scenario's Extension
#POL_SetupWindow_menu "Do you want to install Civilization II Scenario's?" "$TITLE" "Yes No" " "
#if [ "$APP_ANSWER" = "Yes" ]
#  POL_SetupWindow_check_cdrom "$CD_PATH/$STARTUP_FILE" "$CD2_CHECK"
#  POL_Wine start /unix "$CDROM/$CD_INSTALL_FILE"
#  POL_Wine_WaitExit
#fi

POL_SetupWindow_Close
exit 0
