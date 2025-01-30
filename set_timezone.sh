#!/bin/bash

# Define the timezone
TIMEZONE="Asia/Kolkata"

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Set the timezone
echo "Setting timezone to $TIMEZONE..."
sudo timedatectl set-timezone "$TIMEZONE"

# Restart the systemd-timesyncd service to apply changes
echo "Restarting time synchronization service..."
sudo systemctl restart systemd-timesyncd

# Display the updated time and timezone
echo "Current system time and timezone:"
date

echo "Timezone updated successfully to $TIMEZONE."
