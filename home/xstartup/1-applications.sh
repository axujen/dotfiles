#!/usr/bin/env sh
# Startup apps for xorg
# Should run AFTER the DE/WM is started.

# Startup applications
command -v parcellite && parcellite &
command -v compton    && compton -b &
command -v devmon     && devmon-start &
command -v nm-applet  && nm-applet --sm-disable &
command -v redshift   && redshift-toggle on &
command -v rssowl     && rssowl -noSplash &

# Big apps last
command -v keepass-cloud       && keepass-cloud &
