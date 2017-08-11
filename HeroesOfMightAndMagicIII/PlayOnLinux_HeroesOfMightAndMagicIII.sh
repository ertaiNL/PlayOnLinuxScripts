#!/bin/bash
# Date : (2017-08-11 16:07)
# Last Revision : (2017-08-11 16:07)
# Wine Version used : 2.13
# Distribution used to test : Ubuntu 16.04
# Author: ertaiNL
# Script license : GPL v2
# Programm license : Retail
# Depend :

[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"

TITLE="Heroes Of Might And Magic III"
PREFIX="HeroesOfMightAndMagicIII"
PUBLISHER="Ubisoft"
PUBLISHER_URL="http://www.ubisoft.com/"
AUTHOR="ErtaiNL"
WORKING_WINE_VERSION="2.13"
CD_CHECK_FILE="_autorun/support/3do.bmp"
CD_INSTALL_FILE="_setup/Setup.exe"
STARTUP_FILE="Heroes3.exe"

POL_SetupWindow_Init
POL_Debug_Init

POL_SetupWindow_presentation "$TITLE" "$PUBLISHER" "$PUBLISHER_URL" "$AUTHOR" "$PREFIX"

POL_SetupWindow_cdrom
POL_SetupWindow_check_cdrom "$CD_CHECK_FILE"

POL_SetupWindow_message "$(eval_gettext 'NOTICE: You will get a lot of warnings and directX does not work. Install anyway, the game will work.')" "$TITLE"

POL_Wine_SelectPrefix "$PREFIX"
POL_Wine_PrefixCreate "$WORKING_WINE_VERSION"

# Check the disc again since the user could have removed it at this point
POL_SetupWindow_check_cdrom "$CD_CHECK_FILE"
POL_Wine "$CDROM/$CD_INSTALL_FILE"
POL_Wine_WaitExit

POL_Shortcut "$STARTUP_FILE" "$TITLE"

POL_SetupWindow_Close
exit 0
