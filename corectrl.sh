#!/bin/bash

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

