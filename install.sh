#!/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
  echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
  exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Add 32-bit support for Steam
dpkg --add-architecture i386

# Update packages list and update system
apt update
apt upgrade -y

# Install nala
apt install nala -y

# Installing Essential Programs 
nala install kde-plasma-desktop pipewire wireplumber -y
# Installing KDE Programs
nala install ark gwenview kde-spectacle okular plasma-pa plasma-nm -y
# Installing Other less important Programs
nala install steam-installer gamemode mangohud neovim  -y
# Installing fonts 
nala install fonts-noto-color-emoji -y

# Reloading Font
fc-cache -vf

# Enable graphical login and change target from CLI to GUI
systemctl enable sddm
systemctl set-default graphical.target
