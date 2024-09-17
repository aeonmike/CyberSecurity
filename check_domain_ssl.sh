#!/bin/bash

# Function to display the usage of the script
usage() {
    echo "Usage: $0"
    echo "This script fetches SSL/TLS certificate information for a domain using ctfr."
    echo "You will be prompted to enter a domain name."
    exit 1
}

# Check if ctfr is installed
if ! command -v ctfr &> /dev/null; then
    echo "ctfr could not be found. Please install ctfr and try again."
    exit 1
fi

# Prompt for the domain name
read -p "Enter the domain name: " DOMAIN

# Validate that the domain name is not empty
if [[ -z "$DOMAIN" ]]; then
    echo "Domain name cannot be empty."
    exit 1
fi

# Run ctfr to fetch SSL/TLS certificates and format the output
ctfr -d "$DOMAIN" | awk '
BEGIN {
    print "Timestamp                    Issuer                    Subject                    Validity"
    print "------------------------------------------------------------------------------------------"
}
{
    if ($1 ~ /^[0-9]{4}-[0-9]{2}-[0-9]{2}/) {
        timestamp = $1 " " $2
        issuer = substr($0, index($0, $5))
        subject = substr($0, index($0, $7))
        validity = substr($0, index($0, $11))
        printf "%-25s %-25s %-25s %s\n", timestamp, issuer, subject, validity
    }
}
'

# Inform the user that the scan is complete
echo "Certificate information retrieval and formatting are complete."

