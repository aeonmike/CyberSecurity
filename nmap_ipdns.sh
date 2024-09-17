#!/bin/bash

# Function to display the usage of the script
usage() {
    echo "Usage: $0"
    echo "This script performs an nmap list scan on IP addresses or hostnames from a file."
    echo "Ensure that 'ip.lst' exists in the same directory as this script."
    exit 1
}

# Check if nmap is installed
if ! command -v nmap &> /dev/null; then
    echo "nmap could not be found. Please install nmap and try again."
    exit 1
fi

# Check if the input file exists
INPUT_FILE="ip.lst"
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Input file '$INPUT_FILE' not found. Please ensure it exists in the same directory."
    exit 1
fi

# Run nmap with list scan option on the input file
nmap -sL -iL "$INPUT_FILE"

# Inform the user that the scan is complete
echo "Nmap list scan has been completed."

