#!/bin/bash

# include Gnome related config file
. configs/gnomeshell.cfg


. configs/gnomeExtConfigs.cfg

## How can i enable the unchecked repos from the command line?

function userPrompt()
{
	read -p "Press any key to continue"
}

# Update
function updateSystem()
{
    clear
    echo -e "Updating System"

    sudo apt update
    sudo apt upgrade

    echo -e "System Updated"
    userPrompt
    
}


function tweaksMenu(){
while [ $x=1 ]; do

        clear

        echo -e "Xmetal's Ubuntu 20.04 Focal Tweaks Menu\n"

        echo -e "1. \t Change default click action on Ubuntu Dock to Maximize/Open and Minimize"
        echo -e "2. \t Move Show Applications icon to Top (or left, if panel is at the bottom)"
        echo -e "3. \t Adjust Ubuntu Dock Icon Size"
        echo -e "4. \t Move Dock To Bottom"
        echo -e "5. \t Move Dock to Left"

        echo -e "6. \t Adjust Ubuntu Dock Background"

        echo -e
        echo -e "r. \t Reset Ubuntu settings to Default"
        echo -e "q. \t Exit to Prompt \n\n"
        read -p "Your Choice?:" mainSelection

        case $mainSelection in

        1) minMaxUbuntuDock ;;
        2) moveShowApplicationsButton ;;
        3) ubuntuDockFontSize ;;
        4) moveDock 'BOTTOM' ;;
        5) moveDock 'LEFT' ;;

        6) ubuntuDockTransparency ;;

        [rR]) gnomeTweakDefaults ;;
        [qQ]) quitScript ;;

        *) invalidSection ;;

        esac
    done

}




# sudo apt install synpatic gdebi

function main() {

    while [ $x=1 ]; do

        clear

        echo -e "Xmetal's Ubuntu 20.04 Focal Script\n"

        echo -e "1. \t Update your System ( Snaps and Flatpaks support coming later )"
        echo -e "2. \t Add some Gnomeshell items from default repos"
        echo -e "3. \t Fix QT App issue (slow to open)"
        echo -e
        echo -e "T. \t Tweak Menu"


        echo -e "q. \t Exit to Prompt \n\n"
        read -p "Your Choice?:" mainSelection

        case $mainSelection in

        1) updateSystem ;;
        2) gnomeShellAdditions ;;
        3) fixQTApps ;;


        [tT]) tweaksMenu ;;

        [qQ]) quitScript ;;

        *) invalidSection ;;

        esac
    done

}

main