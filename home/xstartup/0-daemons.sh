#!/usr/bin/env sh
# Execute background daemons here

command -v mpd && mpd &
command -v mpdscribble && mpdscribble &
command -v gnome-encfs-manager && gnome-encfs-manager-remount
