#!/bin/bash
cd /home/container

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# set this variable, dotnet needs it even without it it reports to `dotnet --info` it can not start any aplication without this
export DOTNET_ROOT=/usr/share/

# print the dotnet version on startup
printf "\033[1m\033[33mcontainer@pterodactyl~ \033[0mdotnet --version\n"
dotnet --version

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e ":/home/container$ ${MODIFIED_STARTUP}"

# Donation Message
echo -e "\e[32m"  # Set text to green
echo "##############################################"
echo "#                                            #"
echo "#   Please consider donating to Silly Dev!   #"
echo "#           https://bit.ly/4e3XUce           #"
echo "#                                            #"
echo "##############################################"
echo -e "\e[0m"  # Reset text color to default

# Run the Server
eval ${MODIFIED_STARTUP}
