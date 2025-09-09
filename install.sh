#!/bin/bash
# Debian XFCE setup script for older laptops

# Fix up repository
echo "deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list

# Update package lists
sudo apt update

# === 🧰 System Utilities ===
sudo apt install -y \
    gparted gsmartcontrol lshw preload cpu-x xarchiver thunar-archive-plugin \
bleachbit

# === 🎮 User Interface & Desktop ===
sudo apt install -y \
    xfce4 xfce4-goodies xfce4-power-manager  \
    package-update-indicator obsidian-icon-theme papirus-icon-theme \ fonts-jetbrains-mono fonts-recommended

# === 🔒 Security & Backup ===
sudo apt install -y \
    openssh-server ufw timeshift
sudo ufw allow ssh
sudo ufw enable

# === 🌐 Network & Download Tools ===
sudo apt install -y \
    blueman curl wget qbittorrent

# === 🎥 Multimedia ===
sudo apt install -y \
    libavcodec-extra ffmpeg mpv yt-dlp 

# === 🧑‍💻 Productivity & Browsing ===
sudo apt install -y \
    firefox-esr synaptic foliate chromium 

