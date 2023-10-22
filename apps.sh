#!/bin/bash

# Add Google Chrome repository and install Google Chrome
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y google-chrome-stable

# Download and install Proton VPN
wget -q https://repo.protonvpn.com/debian/pool/main/p/protonvpn-stable-release/protonvpn-stable-release_1.0.3-2_all.deb
sudo dpkg -i protonvpn-stable-release_1.0.3-2_all.deb
sudo apt update
sudo apt install -y protonvpn-gnome-desktop

# Install qBittorrent
sudo apt install -y qbittorrent

# Clean up downloaded files
rm protonvpn-stable-release_1.0.3-2_all.deb

echo "Google Chrome, Proton VPN, and qBittorrent are installed."
