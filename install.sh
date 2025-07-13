#!/bin/bash
# Debian modular setup script with categorized install blocks

# Add backports repository
echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | sudo tee -a /etc/apt/sources.list

# Update package lists
sudo apt update

# === 🧰 System Utilities ===
sudo apt install -y \
    gnome-disk-utility gparted gsmartcontrol lshw lm-sensors preload stacer cpu-x

# === 🎮 User Interface & Desktop ===
sudo apt install -y \
    xfce4 xfce4-goodies xfce4-terminal xfce4-power-manager polybar rofi plank \
    package-update-indicator obsidian-icon-theme variety

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
    libavcodec-extra ffmpeg mpv

# === 🧑‍💻 Productivity & Browsing ===
sudo apt install -y \
    libreoffice-writer firefox-esr synaptic

# Cleanup
sudo apt autoremove -y
