#!/bin/bash

set -e

echo "Updating system packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing Nginx..."
sudo apt install -y nginx

echo "Enabling Nginx service..."
sudo systemctl enable nginx
sudo systemctl start nginx

echo "Setting up firewall..."
sudo ufw allow 'Nginx Full'
sudo ufw allow OpenSSH
sudo ufw --force enable

echo "Creating web directory..."
sudo mkdir -p /var/www/html
sudo chown -R www-data:www-data /var/www/html

echo "VPS setup completed"
echo "Next steps:"
echo "1. Configure your domain DNS to point to this server"
echo "2. Setup SSL with: sudo certbot --nginx -d yourdomain.com"
echo "3. Clone your repository to the deploy path"
