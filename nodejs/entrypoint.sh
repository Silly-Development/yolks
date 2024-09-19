#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Print Node.js Version
node -v

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')

# Print the modified startup command
echo ":/home/container$ ${MODIFIED_STARTUP}"

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
