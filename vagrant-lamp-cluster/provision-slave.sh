#!/bin/bash

# Create user 'altschool'
useradd -m -s /bin/bash altschool

# Copy data from Master to Slave
scp -o StrictHostKeyChecking=no -i /home/altschool/.ssh/id_rsa -r altschool@192.168.33.10:/mnt/altschool /mnt/altschool/slave

