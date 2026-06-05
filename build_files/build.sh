#!/bin/bash

set -ouex pipefail

# Add repos
dnf5 -y copr enable avengemedia/dms-git 
dnf5 -y copr enable yalter/niri-git
# Terra repo
dnf -y install --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release

# Use niri-git instead of fedora repo
echo "priority=1" | tee -a /etc/yum.repos.d/_copr:copr.fedorainfracloud.org:yalter:niri-git.repo

### Install packages
dnf5 -y install bat bat-extras btop cava chafa cliphist dgop dms emacs eza fastfetch ghostty-nightly grim input-remapper mangohud niri slurp vkBasalt 
# akmods

# Remove niri-git optional dependencies
dnf5 -y remove alacritty fuzzel mako swaybg swayidle swaylock waybar

#### Example for enabling a System Unit File
#systemctl enable podman.socket
