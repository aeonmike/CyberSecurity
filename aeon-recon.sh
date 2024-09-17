#!/bin/bash

# Function to display the menu
show_menu() {
    clear
    echo "==============================="
    echo "          MAIN MENU"
    echo "==============================="
    echo "1. Run Nmap Vulnerability Scan"
    echo "2. Run CTFR SSL Fetch"
    echo "3. Exit"
    echo
}

# Function to run the Nmap vulnerability scan script
run_nmap_vuln_scan() {
    ./nmap_vuln_scan.sh
}

# Function to run the CTFR SSL fetch script
run_ctfr_ssl() {
    ./ctfr_domain_ssl.sh
}

# Main loop
while true; do
    show_menu
    read -p "Please select an option [1-3]: " choice
    case $choice in
        1)
            run_nmap_vuln_scan
            ;;
        2)
            run_ctfr_ssl
            ;;
        3)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
    read -p "Press Enter to return to the menu..."
done
