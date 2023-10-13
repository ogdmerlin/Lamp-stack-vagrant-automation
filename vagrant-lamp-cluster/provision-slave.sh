#!/bin/bash

# Function to handle errors
handle_error() {
    echo "Error: $1"
    exit 1
}

# Check if user is root
if [[ $EUID -ne 0 ]]; then
    handle_error "This script must be run as root."
fi

# Check if required directory exists
if [ ! -d "/mnt/altschool" ]; then
    handle_error "/mnt/altschool directory does not exist."
fi

# Create user 'altschool'
useradd -m -s /bin/bash altschool || handle_error "Failed to create user altschool."

# Copy data from Master to Slave
scp -o StrictHostKeyChecking=no -i /home/altschool/.ssh/id_rsa -r altschool@192.168.33.10:/mnt/altschool /mnt/altschool/slave || handle_error "Failed to copy data."
