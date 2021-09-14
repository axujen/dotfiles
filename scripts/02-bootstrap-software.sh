#! /bin/sh
## vim: ft=sh
## Install basic software to make sure everything is running
## TODO: add logic for multiple distros, right now only archlinux is supported

if [ `id -u` -ne 0 ]; then
    echo "Please run this script as root"
    exit;
fi

PACKAGES="
git
ranger
xcompmgr
parcellite
xautolock
"

IFS="$(printf '%b_' '\n')"; IFS="${IFS%_}"
for PACKAGE in $PACKAGES; do
    pacman -S --noconfirm "$PACKAGE"
done
