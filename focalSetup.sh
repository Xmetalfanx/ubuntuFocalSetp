#!/bin/bash

configDir=$(eval pwd)/configs

. $configDir/includeConfigs.cfg

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

main