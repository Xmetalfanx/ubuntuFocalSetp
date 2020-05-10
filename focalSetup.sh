#!/bin/bash


function moveShowApplicationsButton()
{
    
    # Moves it to the top when left aligned ... moves the button to the left when the panel is aligned to the bottom
    gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true

}


# Adjusted font size for Ubuntu Dock
# Source: https://linuxconfig.org/how-to-customize-dock-panel-on-ubuntu-20-04-focal-fossa-linux
function ubuntuDockFontSize(){
    gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size $@

}



# Source: http://ubuntuhandbook.org/index.php/2020/04/dynamic-transparency-ubuntu-20-04/#comment-3670390
function fixDynamicPanelTransparency()
{
    echo -e "Replacing intellifade.js file with fix for new Gnome"
    sudo cp /assets/intellifade.js ~/.local/share/gnome-shell/extensions/dynamic-panel-transparency@rockon999.github.io/intellifade.js

}


#  ~/.local/share/gnome-shell/extensions/dynamic-panel-transparency@rockon999.github.io/intellifade.js

## How can i enable the unchecked repos from the command line? 

# 1 - Update
function updateSystem()
{
    sudo apt update 
    sudo apt upgrade 
}


# 2 - Fix for QT app issue 
## Source https://www.linuxuprising.com/2018/05/get-qt5-apps-to-use-native-gtk-style-in.html

function fixQTApps(){

    clear

    echo -e "Installing qt5-style-plugins"
    sudo apt install qt5-style-plugins


    echo -e "Exporting QT_QPA_PLATFORMTHEME variable to Home Folder"
    echo "export QT_QPA_PLATFORMTHEME=gtk2" >> ~/.profile

    echo
    echo -e "You need to Logout and Login or Reboot for this to take effect"
    read -p "Press Any Key To Continue"

    # Message to logut and login again here 


}


# 3 - Gnome Shell related

function gnomeShellAdditions()
{
    sudo apt install gnome-tweak-tool chrome-gnome-shell gnome-shell-extension-impatence gnome-shell-extension-topiconplus
    gnome-shell-extension-gsconnect

}




# 4 - 

sudo apt install synpatic gdebi


# 5 - Sets left dock to max/min for the action 
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'