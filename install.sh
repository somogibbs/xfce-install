#!/bin/bash
# Debian XFCE setup script for older laptops

# Fix up repository
echo "deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list

# Update package lists
sudo apt update

# === 🧰 System Utilities ===
sudo apt install -y \
    gnome-disk-utility gparted gsmartcontrol lshw preload cpu-x 

# === 🎮 User Interface & Desktop ===
sudo apt install -y \
    xfce4 xfce4-goodies xfce4-power-manager  \
    package-update-indicator obsidian-icon-theme numix-icon-theme \
    papirus-icon-theme fonts-firacode fonts-jetbrains-mono fonts-recommended

# === 🔒 Security & Backup ===
sudo apt install -y \
    openssh-server ufw timeshift
sudo ufw allow ssh
sudo ufw enable

# === 🌐 Network & Download Tools ===
sudo apt install -y \
    blueman curl wget fragments

# === 🎥 Multimedia ===
sudo apt install -y \
    libavcodec-extra ffmpeg mpv yt-dlp 

# === 🧑‍💻 Productivity & Browsing ===
sudo apt install -y \
    firefox-esr synaptic foliate

