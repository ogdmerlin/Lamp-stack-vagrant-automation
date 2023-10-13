#!/bin/bash



# Update package index
echo "Updating package index..."
sudo apt update -y

# Install Nginx
echo "Installing Nginx..."
sudo apt install -y nginx

# Define the master and slave node IP addresses
master_ip="192.168.56.3"
slave_ip="192.168.56.4"
# Define the domain name or IP address where you want to access the load balancer
domain="192.168.56.5"

# Create an Nginx configuration file for load balancing
config_file="/etc/nginx/sites-available/load-balancer"
echo "Creating Nginx load balancer configuration at $config_file"

cat <<EOF > "$config_file"
upstream backend {
    server $master_ip:80;
    server $slave_ip:80;
}

server {
    listen 80;
    server_name $domain;

    location / {
        proxy_pass http://backend;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF

# Create a symbolic link to enable the configuration
sudo ln -s "$config_file" "/etc/nginx/sites-enabled/"

# Remove the default Nginx site configuration
sudo rm /etc/nginx/sites-enabled/default

# Test Nginx configuration
echo "Testing Nginx configuration..."
sudo nginx -t

if [ $? -eq 0 ]; then
    # Reload Nginx if the configuration test is successful
    echo "Reloading Nginx..."
    systemctl reload nginx
    echo "Nginx configuration updated successfully."
else
    echo "Nginx configuration test failed. Please check your configuration."
fi
