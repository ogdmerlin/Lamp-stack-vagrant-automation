#!/bin/bash

# Create user 'altschool' with root privileges
useradd -m -s /bin/bash altschool
usermod -aG sudo altschool

# Enable SSH key-based authentication
mkdir -p /home/altschool/.ssh
echo "*******" >> /home/altschool/.ssh/authorized_keys
chmod 700 /home/altschool/.ssh
chmod 600 /home/altschool/.ssh/authorized_keys
chown -R altschool:altschool /home/altschool/.ssh

# Copy data from Master to Slave
scp -o StrictHostKeyChecking=no -i /home/altschool/.ssh/id_rsa -r /mnt/altschool altschool@192.168.33.11:/mnt/altschool/slave

# Display process overview
ps aux | less
