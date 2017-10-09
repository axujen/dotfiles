#!/usr/bin/env sh
# Startup apps for xorg
# Should run AFTER the DE/WM is started.

# Startup applications
# command -v nitrogen			&& nitrogen  --restore &
# command -v blueman-applet	&& blueman-applet &
command -v parcellite		&& parcellite &
command -v compton			&& compton -b &
command -v devmon			&& devmon-start &
command -v nm-applet		&& nm-applet --sm-disable &
command -v redshift			&& redshift-toggle on &
# command -v unclutter		&& unclutter -idle 5 -jitter 2 -not OpenArena &
# command -v calibre-server   && calibre-server --port 5555 --daemonize &

# Big apps last
command -v gnome-encfs-manager && gnome-encfs-manager &
# command -v cantata			&& cantata &
command -v SpiderOak		&& SpiderOak &
command -v keepass-dbox     && keepass-dbox &
