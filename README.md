# Timezone Configuration Script

## Overview
This script is designed to set the system timezone to `Asia/Kolkata` and restart the systemd time synchronization service to apply the changes. The script ensures that it is executed with root privileges to avoid permission issues.

## Script Name
**set_timezone.sh**

## Repository URL
[GitHub Repository](https://github.com/Lalatenduswain/set_timezone)

## Prerequisites
Before running the script, ensure you have:

- A Linux system with `systemd` installed (such as Ubuntu, Debian, CentOS, or Fedora).
- Sudo or root access.
- `timedatectl` command available on the system (default in modern Linux distributions).

## Installation & Usage

### Step 1: Clone the Repository
```bash
git clone https://github.com/Lalatenduswain/set_timezone.git
cd set_timezone
```

### Step 2: Grant Execution Permissions
```bash
chmod +x set_timezone.sh
```

### Step 3: Run the Script
Execute the script as root or using `sudo`:
```bash
sudo ./set_timezone.sh
```

## Explanation of the Script

The script follows these steps:

1. Defines the target timezone as `Asia/Kolkata`.
2. Checks if the script is run as root. If not, it exits with an error message.
3. Uses `timedatectl` to update the system timezone.
4. Restarts the `systemd-timesyncd` service to apply the new settings.
5. Displays the updated date and timezone.
6. Confirms the successful update.

## Script Code

```bash
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
```

## Disclaimer | Running the Script

**Author:** Lalatendu Swain | [GitHub](https://github.com/Lalatenduswain) | [Website](https://blog.lalatendu.info/)

This script is provided as-is and may require modifications or updates based on your specific environment and requirements. Use it at your own risk. The authors of the script are not liable for any damages or issues caused by its usage.

## Donations
If you find this script useful and want to show your appreciation, you can donate via [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain).

## Support or Contact
Encountering issues? Don't hesitate to submit an issue on our [GitHub page](https://github.com/Lalatenduswain/set_timezone/issues).
