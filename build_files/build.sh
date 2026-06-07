#!/bin/bash

set -ouex pipefail

# Add repos
dnf5 -y copr enable avengemedia/dms-git 
dnf5 -y copr enable yalter/niri-git
# Terra repo
dnf -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# Use niri-git instead of fedora repo
echo "priority=1" | tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo

# Install support packages - printing bluetooth etc
dnf5 -y install cups-pk-helper system-config-printer
# bluez bluez-tools bluetool bluez-cups

### Install packages
dnf5 -y install bat bat-extras btop cava chafa cliphist dgop dms dms-greeter dsearch emacs eza fastfetch ghostty-nightly grim input-remapper mangohud niri qt6-qtmultimedia slurp vkBasalt
dnf5 -y install thunar thunar-archive-plugin thunar-media-tags-plugin thunar-vcs-plugin thunar-volman

# Remove niri-git optional dependencies
dnf5 -y remove alacritty fuzzel mako swaybg swayidle swaylock SwayNotificationCenter waybar

#### Example for enabling a System Unit File
#systemctl enable podman.socket
systemctl enable cups.socket

# Setting up DMS Greeter
dms greeter enable
dms greeter sync

