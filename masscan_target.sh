#!/bin/bash

# Function to display the usage of the script
usage() {
    echo "Usage: $0"
    echo "This script will ask for an IP address or subnet and run masscan."
    exit 1
}

# Check if masscan is installed
if ! command -v masscan &> /dev/null; then
    echo "masscan could not be found. Please install masscan and try again."
    exit 1
fi

# Check if configuration file exists
CONFIG_FILE="top1000.conf"
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Configuration file '$CONFIG_FILE' not found. Please ensure it exists."
    exit 1
fi

# Ask for the IP address or subnet
read -p "Enter the IP address or subnet (e.g., 192.168.1.0/24): " IP_SUBNET

# Validate that the IP address or subnet is not empty
if [[ -z "$IP_SUBNET" ]]; then
    echo "IP address or subnet cannot be empty."
    exit 1
fi

# Run masscan with the specified configuration file and IP address/subnet
masscan -c "$CONFIG_FILE" "$IP_SUBNET" -oL masscan.lst
cat masscan.lst | gf ip | anew > ip.lst

# Inform the user that the scan is complete
echo "Masscan scan has been completed."

