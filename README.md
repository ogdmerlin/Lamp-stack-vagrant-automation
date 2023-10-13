Vagrant Ubuntu Cluster with LAMP Stack
Objective
The goal of this project is to develop a bash script that automates the deployment of two Vagrant-based Ubuntu systems, designated as 'Master' and 'Slave', with an integrated LAMP stack on both systems.

Specifications
Infrastructure Configuration
Deploy two Ubuntu systems:
Master Node: This node acts as the control system.
Slave Node: This node is managed by the Master node.
User Management
On the Master node:
Create a user named altschool.
Grant the altschool user root (superuser) privileges.
Inter-node Communication
Enable SSH key-based authentication:
The Master node (altschool user) should seamlessly SSH into the Slave node without requiring a password.
Data Management and Transfer
On initiation:
Copy the contents of /mnt/altschool directory from the Master node to /mnt/altschool/slave on the Slave node. This operation should be performed using the altschool user from the Master node.
Process Monitoring
The Master node should display an overview of the Linux process management, showcasing currently running processes.
LAMP Stack Deployment
Install a LAMP (Linux, Apache, MySQL, PHP) stack on both nodes:
Ensure Apache is running and set to start on boot.
Secure the MySQL installation and initialize it with a default user and password.
Validate PHP functionality with Apache.
Deliverables
Bash Script:

A bash script encapsulating the entire deployment process adhering to the specifications mentioned above.
Documentation:

This README file.
How to Use
Prerequisites:

Ensure you have Vagrant and VirtualBox installed on your system.
Getting Started:

Clone this repository to your local machine.
SSH Key Setup:

Generate an SSH key pair if you haven't already:
css
Copy code
ssh-keygen -t rsa -b 2048
Replace <YOUR_PUBLIC_KEY> in provision-master.sh with your public key.
Running the Script:

Open a terminal and navigate to the project directory.
Run the command:
Copy code
vagrant up
Outcome:

Once the script completes execution, you will have a running Ubuntu cluster with a LAMP stack deployed.
Note
This script is intended for development and testing purposes. Please exercise caution before deploying in a production environment.
