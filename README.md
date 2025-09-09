## 🐧 Debian Install

Standard Readme for my Debian Linux install with either GNOME, XFCE, or LXQT. A list of post-install customizations is listed after the initial install instructions in both commands and internet links.

---

## 🔗 Table of Contents

- [⚙️ Git and Run the Script](#⚙️git-and-run-the-script)
- [📶 Post-Install WiFi Setup](#post-install-wifi-setup)
- [🖨️ Lychee Slicer](#lychee-slicer-deb-package)
- [🎮 Heroic Launcher](#heroic-latest-deb-package)
- [🦁 Brave Browser](#brave-browser-install)
- [🦊 Floorp Browser](#floorp-browser-install)
- [📻 SomaFM GNOME Extension](#somafm-gnome-extension)
- [📦 Flatpak & Tips](#flatpak-install--tips)
- [🧰 SSH Service Check](#ssh-check)
- [📡 Tera Radio](#install-tera-radio)
- [🎮 PCSX2 AppImage](#get-latest-pcsx2-release)
- [🕹️ RPCS3 AppImage](#download-rpcs3-appimage)
- [🐬 Dolphin Emulator](#github-dolphin-emulator-appimage)
- [🗂️ Emulators in Debian Repo](#emulators-in-debian-repo)
- [🎮 APT Emulators](#psx-ps2-gc-switch-emulators-in-apt)
- [🕹️ Steam CLI Install](#steam-cli-install)
- [🗂️ Create Custom Folders](#create-custom-folders)
- [🧰 Install CoolerControl](#install-coolercontrol)
- [📦 Liquorix Kernel](#liquorix-kernel-install)
- [⚙️ Download TinyMediaManager](#download-tinymediamanager)
- [⚙️ Change Grub Wallpaper Resolution](#change-grub-wallpaper-resolution-if-needed)

---

## ⚙️ Git and Run the Script  

Before anything be aware that the trixie installer will comment out your apt sources when installing from a usb and the source list will not include a web link to the Debian repo if you don't select "yes" to adding a network mirror during install. 
So if you run into problems obtaining packages type `sudo apt edit-sources`, pick nano as the editor, then add this line  
`deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware` with no hashtag (#) at the beginning.  
`Ctrl+o` to save and `Ctrl+x` to exit.

### 🔑 Set up Sudo
If you enabled root during the standard.iso install:

From the command line type `apt install sudo`
Then type `adduser your-username sudo`

### ⬇️ Clone Repo and Run Install Script

Install git from command line with `sudo apt install git`
Clone repo with `git clone https://github.com/somogibbs/debian-install.git` -or-
`git clone https://github.com/somogibbs/xfce-install.git` -or-
`git clone https://github.com/somogibbs/lxqt-install.git`
Enter the folder `cd (debian-xfce-lxqt)-install` and list files with `ls`
Make the .sh file executable with `chmod +x install.sh`
Run the program by entering `./install.sh` in the terminal 

---

## 📶 Post-Install WiFi Setup
### ***This is specifically for the Gnome desktop***
Remove Debian’s default manager:
```bash
sudo apt purge ifupdown -y
sudo nano /etc/NetworkManager/NetworkManager.conf
```
Ensure `managed=true` is set under `[ifupdown]`. Then:
```
sudo systemctl restart NetworkManager
sudo shutdown -r now
```

---

## 🖨️ Lychee Slicer .deb Package  
🔗 [Lychee Slicer](https://mango3d.io/download-lychee-slicer)

---

## 🎮 Heroic Latest .deb Package  
🔗 [Heroic GitHub Releases](https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases)

---

## 🦁 Brave Browser Install
```
curl -fsS https://dl.brave.com/install.sh | sh
```

---

## 🦊 Floorp Browser Install
```
curl -fsSL https://ppa.floorp.app/KEY.gpg | sudo gpg --dearmor -o /usr/share/keyrings/Floorp.gpg
sudo curl -sS --compressed -o /etc/apt/sources.list.d/Floorp.list 'https://ppa.floorp.app/Floorp.list'
sudo apt update
sudo apt install floorp
```

---

## 📻 SomaFM GNOME Extension
```
git clone https://github.com/alireza6677/somafm-radio-gnome-ext
cd somafm-radio-gnome-ext
cp -r SomaFm-Radio@alireza6677.gmail.com ~/.local/share/gnome-shell/extensions/
```

---

## 📦 Flatpak Install & Tips
```
sudo apt install flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.github.tchx84.Flatseal
```

Useful commands:
```
flatpak update
flatpak list
flatpak history
```
To install a flatpak via terminal:
```
sudo flatpak install flathub [package-name]
```

---

## 🧰 SSH Check
To check if SSH is running:  
```
service ssh status
sudo systemctl status ssh
```
To start up SSH:  
```
sudo systemctl enable --now ssh
```

---

## 📡 Install Tera Radio
```
sudo apt install fzf gh mpv jq wget
wget https://github.com/shinokada/tera/releases/download/v0.4.3/tera_0.4.3-1_all.deb
sudo dpkg -i tera_0.4.3-1_all.deb
rm -rf ./tera_0.4.3-1_all.deb
```

---

## 🎮 Get Latest PCSX2 Release
```
wget https://github.com/PCSX2/pcsx2/releases/download/v2.4.0/pcsx2-v2.4.0-linux-appimage-x64-Qt.AppImage
```

---

## 🕹️ Download RPCS3 AppImage
```
curl -JLO https://rpcs3.net/latest-appimage
```

---

## 🐬 GitHub Dolphin Emulator AppImage  
🔗 [Dolphin Releases](https://github.com/pkgforge-dev/Dolphin-emu-AppImage/releases/latest)

---

## 🗂️ Emulators in Debian Repo  
🔗 [Debian Emulator Blend](https://blends.debian.org/games/tasks/emulator)

---

## 🎮 PSX, PS2, GC, Switch Emulators in APT
```
sudo apt install pcsxr pcsx2 dolphin-emu yuzu
```
Note that pcsx2 is pretty out of date

---

## 🕹️ Steam CLI Install 

Edit your `/etc/apt/sources.list` to include "non-free" sources  
```
deb http://deb.debian.org/debian/ trixie main contrib non-free
```

Enable multiarch + update:
```
sudo dpkg --add-architecture i386
sudo apt update
```

Install required packages:
```
sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386 \
libgl1-mesa-dri:i386 steam-installer
```

Enable backports for newest mesa drivers (optional):
```
echo "deb http://deb.debian.org/debian trixie-backports main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
```

Search backports by adding -t trixie-backports runner:
```
sudo apt search mesa-vulkan-drivers -t trixie-backports
sudo apt install mesa-vulkan-drivers -t trixie-backports
```
Note - Trixie released August 2025 so backports won't be available immediately. 

---

## 🗂️ Create Custom Folders 
```
mkdir -p ~/.themes/
mkdir -p ~/.icons/
mkdir -p ~/.fonts/
mkdir -p ~/.wallpapers/
mkdir -p ~/.appimages
mkdir -p ~/.local/share/xfce4/terminal/colorschemes
mkdir -p ~/.config/rofi
```

---

## 🧰 Install CoolerControl
```
sudo apt install curl apt-transport-https
curl -1sLf \
  'https://dl.cloudsmith.io/public/coolercontrol/coolercontrol/setup.deb.sh' \
  | sudo -E bash
sudo apt update
sudo apt install coolercontrol
```

---

## 📦 Liquorix Kernel Install
```
curl -s 'https://liquorix.net/install-liquorix.sh' | sudo bash
```

---

## ⚙️ Download TinyMediaManager    
```
wget https://release.tinymediamanager.org/v5/dist/tinyMediaManager-5.1.8-linux-amd64.tar.xz
```

---

## ⚙️ Change Grub Wallpaper Resolution (if needed)
Enter the grub config with `sudo nano /etc/default/grub`  
Find the line with `#GRUB_GFXMODE=640X480`  
Uncomment the line and change value. A safe value to change it to is 1280x720.  Write the file out in nano with `CTRL+O` then  
`CTRL+X` to exit.  Then update with `sudo update-grub`
