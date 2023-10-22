#!/bin/bash

# Clone the repository
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
cd stable-diffusion-webui

# Set Python version
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.10 5

# Upgrade pip and install required Python packages
python -m pip install --upgrade pip wheel -y

# Set the HSA_OVERRIDE_GFX_VERSION environment variable
export HSA_OVERRIDE_GFX_VERSION=10.3.0

# Create and activate a Python virtual environment
python -m venv venv
source venv/bin/activate

# Install PyTorch, torchvision, and torchaudio with ROCm support
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/rocm5.6

# Install and upgrade diffusers and transformers
pip install --upgrade diffusers torch
pip install --upgrade transformers accelerate
