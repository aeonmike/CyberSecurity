#!/bin/bash

# Function to display the usage of the script
usage() {
    echo "Usage: $0"
    echo "This script performs a vulnerability scan with Nmap on ports 22, 80, and 443."
    echo "The results are formatted in columns."
    echo "You will be prompted to enter an IP address or domain."
    exit 1
}

# Check if nmap is installed
if ! command -v nmap &> /dev/null; then
    echo "nmap could not be found. Please install nmap and try again."
    exit 1
fi

# Prompt for the IP address or domain
read -p "Enter the IP address or domain: " TARGET

# Validate that the IP address or domain is not empty
if [[ -z "$TARGET" ]]; then
    echo "IP address or domain cannot be empty."
    exit 1
fi

# Run nmap with the specified parameters and format the output
nmap --script="vuln" -p 22,80,443 "$TARGET" | \
awk '
BEGIN {
    print "Port   State   Service           Reason"
    print "---------------------------------------"
}
{
    if ($1 ~ /^[0-9]+\/tcp$/) {
        port = $1
        state = $2
        service = $3
        reason = ""
        getline
        if ($1 ~ /^|/) {
            reason = $0
            gsub(/^\|/, "", reason)
        }
        printf "%-6s %-6s %-15s %s\n", port, state, service, reason
    }
}
' 

# Inform the user that the scan is complete
echo "Nmap vulnerability scan has been completed and formatted."

