#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
	foot         \
	gawk         \
	imake        \
	libdrm       \
	libglvnd     \
	libnotify    \
	libx11       \
	libxcb       \
	libxi        \
	libxkbfile   \
	libxpresent  \
	libxrandr    \
	libxshmfence \
	pixman       \
	wayland

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
make-aur-package 12to11-git
