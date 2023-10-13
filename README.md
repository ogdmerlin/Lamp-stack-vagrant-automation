Vagrant Ubuntu Cluster with LAMP Stack


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
Copy the contents of /mnt/altschool directory from the Master node to /mnt/altschool/slave on the Slave node. This operation should be performed using the altschool user from the Master node.

Process Monitoring
The Master node should display an overview of the Linux process management, showcasing currently running processes.

LAMP Stack Deployment
Install a LAMP (Linux, Apache, MySQL, PHP) stack on both nodes:
Ensure Apache is running and set to start on boot.
Secure the MySQL installation and initialize it with a default user and password.
Validate PHP functionality with Apache.


Bash Script:
A bash script encapsulating the entire deployment process adhering to the specifications mentioned above.

Documentation:
Ensure you have Vagrant and VirtualBox installed on your system.
Getting Started:

Clone this repository to your local machine.
SSH Key Setup:

Generate an SSH key pair if you haven't already:
ssh-keygen -t rsa -b 2048


Open a terminal and navigate to the project directory.
Run the command:
vagrant up


Once the script completes execution, you will have a running Ubuntu cluster with a LAMP stack deployed.


Note
This script is intended for development and testing purposes. Please exercise caution before deploying in a production environment.
