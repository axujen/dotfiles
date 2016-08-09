#!/usr/bin/env sh
# Startup apps for xorg
# Should run AFTER the DE/WM is started.

# Startup applications
command -v nitrogen			&& nitrogen  --restore &
command -v blueman-applet	&& blueman-applet &
command -v clipit			&& clipit &
command -v compton			&& compton -b &
command -v devmon			&& devmon-start &
command -v nm-applet		&& nm-applet --sm-disable &
command -v redshift			&& redshift-toggle on &
command -v unclutter		&& unclutter -idle 5 -jitter 2 -not OpenArena &

# Big apps last
command -v cantata			&& cantata &
command -v keepassx			&& keepassx &
command -v SpiderOak		&& SpiderOak &
