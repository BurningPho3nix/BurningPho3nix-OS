#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# custom repos

ostree remote add easy-rpm-ostree-tools https://copr.fedorainfracloud.org/coprs/burningpho3nix/private-projects/repo/fedora-$(rpm -E %fedora)/burningpho3nix-private-projects-fedora-$(rpm -E %fedora).repo
ostree remote add Setup-Tool https://copr.fedorainfracloud.org/coprs/burningpho3nix/Setup-Tool/repo/fedora-$(rpm -E %fedora)/burningpho3nix-Setup-Tool-fedora-$(rpm -E %fedora).repo


# this installs a package from fedora repos
# rpm-ostree install 

# this would install a package from rpmfusion
rpm-ostree install steam

# this installs packages from custom repos
rpm-ostree install setup-tool
rpm-ostree install easy-rpm-ostree-tooling

#### Example for enabling a System Unit File

systemctl enable podman.socket

