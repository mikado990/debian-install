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

# Installing Essential Programs 
apt install kde-plasma-desktop sddm vim -y
# Installing KDE Programs
apt install ark gwenview okular -y
# Installing Gaming programs
apt install gamemode mangohud lutris wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386 -y
# Installing Other less important Programs
apt install vlc tealdeer firefox-esr thunderbird qbittorrent -y
# Installing Samba shares support
apt install samba kdenetwork-filesharing -y
# Installing flatpak support
apt install flatpak kde-config-flatpak -y

# Enable graphical login and change target from CLI to GUI
systemctl enable sddm
