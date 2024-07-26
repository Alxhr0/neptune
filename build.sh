#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

wget https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-40/solopasha-hyprland-fedora-40.repo -O /etc/yum.repos.d/solopasha-hyprland-fedora-40.repo
wget https://download.opensuse.org/repositories/home:Alxhr0/Fedora_40/home:Alxhr0.repo -O /etc/yum.repos.d/home:Alxhr0.repo

# this installs a package from fedora repos
rpm-ostree install qemu virt-manager rpm-devel tmate merkuro kf6-servicemenus-imagetools

# this would install a package from rpmfusion
# rpm-ostree install vlc

#### Example for enabling a System Unit File

systemctl enable podman.socket libvirtd.service
