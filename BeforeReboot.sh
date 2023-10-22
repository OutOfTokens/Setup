#!/bin/bash

# Download the AMDGPU installation package
sudo wget https://repo.radeon.com/amdgpu-install/5.6/ubuntu/jammy/amdgpu-install_5.6.50600-1_all.deb

# Install the AMDGPU package
sudo apt install ./amdgpu-install_5.6.50600-1_all.deb -y

# Add the current user to the 'render' and 'video' groups
sudo usermod -a -G render $USER
sudo usermod -a -G video $USER

# Install AMDGPU with specific options
sudo amdgpu-install -y --usecase=rocm --no-dkms

# Install necessary packages
sudo apt-get install git python3.10-venv python3-pip libstdc++-12-dev -y

echo "Rebooting the system in 60 seconds..."
sleep 60
sudo reboot
