#!/bin/bash

# Function to display the usage of the script
usage() {
    echo "Usage: $0"
    echo "This script will ask for the adapter IP and run masscan."
    exit 1
}

# Check if masscan is installed
if ! command -v masscan &> /dev/null; then
    echo "masscan could not be found. Please install masscan and try again."
    exit 1
fi

# Ask for the adapter IP
read -p "Enter the adapter IP: " ADAPTER_IP

# Validate that the adapter IP is not empty
if [[ -z "$ADAPTER_IP" ]]; then
    echo "Adapter IP cannot be empty."
    exit 1
fi

# Run masscan with the specified parameters
masscan --top-ports 100 --rate 10000 --adapter-ip "$ADAPTER_IP" --echo

# Inform the user that the scan is complete
echo "Masscan scan has been completed."

