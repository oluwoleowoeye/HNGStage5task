#!/bin/bash

# Install necessary dependencies
sudo apt update
sudo apt install -y ss docker.io nginx

# Create a systemd service
sudo cp systemd/devopsfetch.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable devopsfetch.service
sudo systemctl start devopsfetch.service

echo "Installation completed and service started!"
