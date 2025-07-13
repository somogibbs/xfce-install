#!/bin/bash
# Debian setup script: packages, UFW, and backports

# Add backports repo
echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | sudo tee -a /etc/apt/sources.list

# Update sources
sudo apt update

# Install packages
sudo apt install -y \
    xfce4 xfce4-goodies blueman synaptic package-update-indicator \
    gnome-disk-utility gparted gsmartcontrol libavcodec-extra ffmpeg mpv qbittorrent \
    timeshift openssh-server curl wget lshw stacer cpu-x lm-sensors preload \
    xfce4-terminal libreoffice-writer firefox-esr obsidian-icon-theme variety \
    xfce4-power-manager polybar rofi plank ufw

# Setup UFW
sudo ufw allow ssh
sudo ufw enable

# Cleanup
sudo apt autoremove -y
