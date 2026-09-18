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
#make-aur-package 12to11-git

echo "Building 12to11..."
echo "---------------------------------------------------------------"
git clone https://github.com/Samueru-sama/12to11 ./12to11 && (
	cd ./12to11
	make PREFIX=/usr ANALYZE=0
	make PREFIX=/usr DESTDIR=/ install
)
