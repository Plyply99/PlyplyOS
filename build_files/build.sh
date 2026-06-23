#!/bin/bash

set -ouex pipefail

# Add dnf plugins
dnf5 -y install dnf5-plugins

# Add hardware codecs and multimedia
dnf5 -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 -y groupinstall @multimedia
dnf5 -y swap mesa-va-drivers mesa-va-drivers-freeworld
dnf5 -y swap ffmpeg-free ffmpeg --allowerasing

dnf5 -y copr enable avengemedia/dms-git 
dnf5 -y copr enable yalter/niri-git
# Terra repo
dnf -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# Use niri-git instead of fedora repo
echo "priority=1" | tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo

### Install packages
dnf5 -y install adw-gtk3-theme bat bat-extras btop cava chafa cliphist dgop distrobox dms dms-greeter dsearch emacs eza fastfetch ghostty gnome-disk-utility grim htop input-remapper mangohud mpv nautilus niri nwg-look python3-dbus-next qt6-qtmultimedia slurp vkBasalt
dnf5 -y install cups-pk-helper fprintd i2c-tools kf6-kimageformats khal power-profiles-daemon xwininfo

# Gnome software center
dnf5 -y install gnome-software gnome-software-rpm-ostree

# Hyprland
dnf5 -y copr enable nett00n/hyprland 
dnf5 -y install hyprland hyprland-guiutils hyprpicker uwsm

# Remove niri-git and hyprland optional dependencies
dnf5 -y remove alacritty fuzzel mako swaybg swayidle swaylock SwayNotificationCenter waybar

#### Example for enabling a System Unit File
#systemctl enable podman.socket
systemctl enable cups.socket
systemctl enable greetd.service
