#!/bin/bash

# Function to display the usage of the script
usage() {
    echo "Usage: $0"
    echo "This script performs an nmap version scan with http-enum script on ports 80 and 443."
    echo "You will be prompted to enter a domain or IP address."
    exit 1
}

# Check if nmap is installed
if ! command -v nmap &> /dev/null; then
    echo "nmap could not be found. Please install nmap and try again."
    exit 1
fi

# Prompt for the domain or IP address
read -p "Enter the domain or IP address: " TARGET

# Validate that the domain or IP address is not empty
if [[ -z "$TARGET" ]]; then
    echo "Domain or IP address cannot be empty."
    exit 1
fi

# Run nmap with the specified parameters
nmap -sV --script="http-enum" -p 80,443 "$TARGET"

# Inform the user that the scan is complete
echo "Nmap scan with http-enum script on ports 80 and 443 has been completed."

