#!/bin/bash

# Function to display the menu
show_menu() {
    clear
    echo "==============================="
    echo "      Aeon-Recon MAIN MENU     "
    echo "==============================="
    echo "1. Check Domain SSL"
    echo "2. Run Masscan"
    echo "3. Run Masscan with Target File"
    echo "4. Check Nmap Vulnerabilities"
    echo "5. Run Nmap HTTP Enumeration"
    echo "6. Resolve IP to DNS with Nmap"
    echo "7. Exit"
    echo
}

# Function to run the Check Domain SSL script
run_check_domain_ssl() {
    ./check_domain_ssl.sh
}

# Function to run the Masscan script
run_masscan() {
    ./masscan.sh
}

# Function to run the Masscan with Target File script
run_masscan_target() {
    ./masscan_target.sh
}

# Function to run the Nmap Check Vulnerabilities script
run_nmap_checkvuln() {
    ./nmap_checkvuln.sh
}

# Function to run the Nmap HTTP Enumeration script
run_nmap_httpenum() {
    ./nmap_httpenum.sh
}

# Function to run the Nmap IP to DNS script
run_nmap_iptodns() {
    ./nmap_iptodns.sh
}

# Main loop
while true; do
    show_menu
    read -p "Please select an option [1-7]: " choice
    case $choice in
        1)
            run_check_domain_ssl
            ;;
        2)
            run_masscan
            ;;
        3)
            run_masscan_target
            ;;
        4)
            run_nmap_checkvuln
            ;;
        5)
            run_nmap_httpenum
            ;;
        6)
            run_nmap_iptodns
            ;;
        7)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
    read -p "Press Enter to return to the menu..."
done
