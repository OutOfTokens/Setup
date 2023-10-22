#!/bin/bash

#!/bin/bash

# Define the download link
download_link="https://pixeldrain.com/api/file/Wdo8q5q6?download"

# Define the destination directory for extraction and the .config folder path
extract_dir="/tmp/extracted_data"
config_dir="$HOME/.config"

# Create the extraction directory if it doesn't exist
mkdir -p "$extract_dir"

# Download the tar.gz file
wget -O "$extract_dir/archive.tar.gz" "$download_link"

# Check if the download was successful
if [ $? -eq 0 ]; then
  # Extract the contents
  tar -xzf "$extract_dir/archive.tar.gz" -C "$extract_dir"
  
  # Copy the contents to the .config folder
  cp -r "$extract_dir/"* "$config_dir"

  # Clean up the temporary directory
  rm -rf "$extract_dir"

  echo "Download, extraction, and copying to .config completed successfully."
else
  echo "Download failed. Check the download link and try again."
fi

# Check if corectrl is available in the official repository
if sudo apt list --installed corectrl | grep -q corectrl; then
  echo "corectrl is already installed. No need to add the Ernst PPA."
else
  # Add the Ernst PPA
  sudo add-apt-repository ppa:ernstp/mesarc

  # Update the package list
  sudo apt update

  # Create the /etc/apt/preferences.d/corectrl file
  echo "# Never prefer packages from the ernstp repository
  Package: *
  Pin: release o=LP-PPA-ernstp-mesarc
  Pin-Priority: 1

  # Allow upgrading only corectrl from LP-PPA-ernstp-mesarc
  Package: corectrl
  Pin: release o=LP-PPA-ernstp-mesarc
  Pin-Priority: 500" | sudo tee /etc/apt/preferences.d/corectrl

  # Install corectrl
  sudo apt install corectrl -y
fi

# Install additional packages
#sudo apt-get install -y 
