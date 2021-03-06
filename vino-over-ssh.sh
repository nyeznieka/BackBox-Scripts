# This is small script to enable vino-server when you are connect via SSH to BackBox.
# To install vino apt-get install vino.
# Set remote desktop connection running vino-preferences in terminal.
# Run this script in SSH session.
# This script was made by ZEROF <zerof@backbox.org>

#!/bin/bash

selection=
until [ "$selection" = "0" ]; do
    echo ""
    echo -e "\e[40;38;5;82m VINO \e[30;48;5;82m SETTINGS \e[0m"
    echo ""
    echo "PROGRAM MENU (go from 1 to 4)"
    echo "1 - enable remote desktop"
    echo "2 - disable remote prompt"
    echo "3 - export display settings"
    echo "4 - start vino-server"
    echo ""
    echo "0 - exit program"
    echo ""
    echo -n "Enter selection: "
    read selection
    echo ""
    case $selection in
    
	1 ) gconftool-2 -s -t bool /desktop/gnome/remote_access/enabled true ;;
  	2 ) gconftool-2 --type bool --set /desktop/gnome/remote_access/prompt_enabled 0 ;;
	3 ) export DISPLAY=:0.0 ;;
	4 ) /usr/lib/vino/vino-server ;;
	0 ) exit ;;
        * ) echo "Please enter 1, 2, 3, 4 or 0"
    esac
done
