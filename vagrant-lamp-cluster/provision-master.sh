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

# Create user 'altschool' with root privileges
useradd -m -s /bin/bash altschool || handle_error "Failed to create user altschool."
usermod -aG sudo altschool || handle_error "Failed to add user to sudo group."

# Enable SSH key-based authentication
if [ ! -d "/home/altschool/.ssh" ]; then
    mkdir -p /home/altschool/.ssh || handle_error "Failed to create .ssh directory."
fi

echo my_sshkey.pub  >> /home/altschool/.ssh/authorized_keys || handle_error "Failed to append public key."

chmod 700 /home/altschool/.ssh || handle_error "Failed to set permissions for .ssh directory."
chmod 600 /home/altschool/.ssh/authorized_keys || handle_error "Failed to set permissions for authorized_keys file."
chown -R altschool:altschool /home/altschool/.ssh || handle_error "Failed to change ownership of .ssh directory."

# Copy data from Master to Slave
scp -o StrictHostKeyChecking=no -i /home/altschool/.ssh/id_rsa -r /mnt/altschool altschool@192.168.33.11:/mnt/altschool/slave || handle_error "Failed to copy data."

# Display process overview
ps aux

