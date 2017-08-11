#!/bin/bash
# Date : (2015-10-18 22:18)
# Last Revision : (2017-08-11 16:20)
# Wine Version used : 2.13
# Distribution used to test : Ubuntu 16.04
# Author: ertaiNL
# Script license : GPL v2
# Programm license : Retail
# Depend :

[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"

TITLE="Civilization II"
TITLE_MAPS="Civilization II Map editor"
PREFIX="CivilizationII"
PUBLISHER="Microprose"
AUTHOR="ErtaiNL"
WORKING_WINE_VERSION="2.13"
STARTUP_FILE="civ2.exe"
STARTUP_FILE_MAPS="civ2map.exe"
CD_PATH="civ2"
CD_INSTALL_FILE="setup.exe"

WARNING_TEXT="There are a few parts of the installation that don't work correctly.\n
1. Sound of Civilization II isn't working in wine. So the sound-driver will be be disabled.\n
2. The installer of Civilization II will give the error\n
   'Unable to locate or run Program Manager'\n
   This warning can be ignored.\n
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
POL_SetupWindow_check_cdrom "$CD_PATH/$STARTUP_FILE"
POL_Wine start /unix "$CDROM/$CD_INSTALL_FILE"
POL_Wine_WaitExit

POL_Shortcut "$STARTUP_FILE" "$TITLE"
POL_Shortcut "$STARTUP_FILE_MAPS" "$TITLE_MAPS"

POL_SetupWindow_Close
exit 0
