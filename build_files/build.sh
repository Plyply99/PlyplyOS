#!/bin/bash

set -ouex pipefail

# Add copr repos
dnf5 -y copr enable avengemedia/dms-git 
dnf5 -y copr enable yalter/niri-git
dnf5 -y copr enable nett00n/hyprland 
# Terra repo
dnf -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# Use niri-git instead of fedora repo
echo "priority=1" | tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo

### Install packages
dnf5 -y install hyprland hyprpicker uwsm
dnf5 -y install adw-gtk3-theme bat bat-extras btop cava chafa cliphist dgop dms dms-greeter dsearch emacs eza fastfetch ghostty gnome-disk-utility grim input-remapper mangohud mpv nautilus niri nwg-look qt6-qtmultimedia slurp vkBasalt

# Gnome software center
dnf5 -y install gnome-software gnome-software-rpm-ostree

# Remove niri-git optional dependencies
dnf5 -y remove alacritty fuzzel mako swaybg swayidle swaylock SwayNotificationCenter waybar

#### Example for enabling a System Unit File
#systemctl enable podman.socket
systemctl enable cups.socket
systemctl enable greetd.service


