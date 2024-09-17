#!/bin/bash

# Function to display the usage of the script
usage() {
    echo "Usage: $0"
    echo "This script performs an nmap list scan, extracts domains, and saves them to domain.lst."
    echo "Ensure that 'ip.lst' exists in the same directory as this script."
    echo "Also, ensure that 'gf' and 'anew' are installed and available in your PATH."
    exit 1
}

# Check if nmap, gf, and anew are installed
if ! command -v nmap &> /dev/null; then
    echo "nmap could not be found. Please install nmap and try again."
    exit 1
fi

if ! command -v gf &> /dev/null; then
    echo "gf could not be found. Please install gf and try again."
    exit 1
fi

if ! command -v anew &> /dev/null; then
    echo "anew could not be found. Please install anew and try again."
    exit 1
fi

# Check if the input file exists
INPUT_FILE="ip.lst"
if [[ ! -f "$INPUT_FILE" ]]; then
    echo "Input file '$INPUT_FILE' not found. Please ensure it exists in the same directory."
    exit 1
fi

# Perform nmap list scan and extract domains
nmap -sL -iL "$INPUT_FILE" | gf domain | anew > domain.lst

# Inform the user that the process is complete
echo "Domain extraction has been completed and saved to domain.lst."
