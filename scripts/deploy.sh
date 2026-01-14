#!/bin/bash

set -e

echo "Starting deployment..."

echo "Syncing files to web root..."
sudo rsync -av --delete \
    --exclude '.git' \
    --exclude '.github' \
    --exclude 'scripts' \
    --exclude 'README.md' \
    --exclude '.gitignore' \
    ./ /var/www/html/

sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/

echo "Reloading Nginx..."
sudo systemctl reload nginx

echo "Deployment completed successfully"
