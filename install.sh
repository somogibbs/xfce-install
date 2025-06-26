!#/bin/bash
## Packages to install
sudo apt install blueman synaptic package-update-indicator gnome-disk-utility gparted
gsmartcontrol hardinfo doublecmd-gtk pdfarranger onboard bleachbit diskscan wireshark guymager uget

#Enable Debian backports
echo "deb http://deb.debian.org/debian bookworm-backports main contrib non-free-firmware" | sudo tee -a /etc/apt/sources.list

#Get qdiskinfo from backport repo
sudo apt install qdiskinfo