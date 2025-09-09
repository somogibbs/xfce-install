#!/bin/bash
set -e  # Exit on error

# Log output to install.log
exec > >(tee -i install.log)
exec 2>&1

# Fix up repository
echo "deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list

echo "🔧 Updating package list..."
sudo apt update

# 🖥️ XFCE Desktop Environment
echo "🖥️ Installing XFCE components..."
sudo apt -y install \
  xfce4 xfce4-goodies xfce4-power-manager package-update-indicator blueman \
  oxygen-icon-theme papirus-icon-theme obsidian-icon-theme moka-icon-theme \
  fonts-recommended fonts-jetbrains-mono yaru-theme-gtk orchis-gtk-theme \
  greybird-gtk-theme breeze-gtk-theme darkcold-gtk-theme

# 🎨 Media & Creative Tools
echo "🎨 Installing media and creative tools..."
sudo apt -y install \
  libavcodec-extra ffmpeg mpv yt-dlp calibre easytag hollywood cmatrix cava

# 🌐 Network & Remote Access
echo "🌐 Installing network and remote access tools..."
sudo apt -y install \
  openssh-server curl wget preload qbittorrent

# 🧰 System Utilities & Diagnostics
echo "🧰 Installing system utilities and diagnostics..."
sudo apt -y install \
  synaptic lshw cpu-x btop lm-sensors fastfetch timeshift gamemode bleachbit \
  gnome-disk-utility gparted gsmartcontrol xarchiver thunar-archive-plugin

# 📝 Productivity & Browsers
echo "📝 Installing productivity tools and browsers..."
sudo apt -y install \
  libreoffice-writer firefox-esr chromium

# 🎮 Gaming & Emulation
echo "🎮 Installing gaming and emulation tools..."
sudo apt -y install \
  yuzu

# 📦 Flatpak Setup
echo "📦 Installing Flatpak and adding Flathub..."
sudo apt -y install flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# 📦 Flatpak Applications
echo "📦 Installing Flatpak applications..."
flatpak install --noninteractive flathub \
  tv.plex.PlexDesktop \
  com.usebottles.bottles \
  it.mijorus.gearlever

# 📡 Speedtest CLI
echo "📡 Installing Speedtest CLI..."
curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh | sudo bash
sudo apt -y install speedtest

# 🔐 Bitwarden
echo "🔐 Installing Bitwarden..."
wget "https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=deb" -O bitwarden.deb
sudo apt install ./bitwarden.deb

# 📝 Joplin
echo "📝 Installing Joplin..."
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# 🛡️ Proton VPN
echo "🛡️ Installing Proton VPN..."
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update
sudo apt install proton-vpn-gnome-desktop

# 🎮 Steam Installer
echo "🎮 Installing Steam Installer..."
sudo dpkg --add-architecture i386 && sudo apt update
sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 libgl1-mesa-dri:i386 steam-installer

# 🛡️ UFW Firewall
echo "🛡️ Setting up UFW firewall..."
sudo apt -y install ufw
sudo ufw allow ssh
sudo ufw enable

# 🎮 Fallout GRUB Theme
echo "🎮 Installing Fallout GRUB theme..."
wget -O - https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh | bash

# 📁 Folder Setup
echo "📁 Creating folders..."
mkdir -p ~/.fonts ~/.icons ~/.wallpapers ~/.themes ~/AppImages
mkdir -p ~/.local/share/xfce4/terminal/colorschemes

# 🔤 Iosevka Nerd Font
echo "🔤 Installing Iosevka Nerd Font v3.4.0..."
wget -O Iosevka.tar.xz "https://sourceforge.net/projects/nerd-fonts.mirror/files/v3.4.0/Iosevka.tar.xz/download"
mkdir -p ~/.fonts/Iosevka
tar -xf Iosevka.tar.xz -C ~/.fonts/Iosevka
rm Iosevka.tar.xz
fc-cache -fv

# 🔁 Reboot
echo "🔁 Rebooting system..."
sudo shutdown -r now
