## vim: ft=sh
## ~/.xstartup/staartup.sh: starts gui applications after the wm
## don't execute this file directly, use ~/.xstartup/init to make sure 
## its loaded once per xorg session. if you execute this directly in the
## wm, you will execute duplicates if you use the WM/DE restart function
## NOTE: use the inPath function definied in init to check if a binary exists in $PATH
exec 2>&1

# Screensaver
if inPath xautolock; then
    inPath i3lock && xautolock -time 5 -locker 'i3lock -fc 000000; xset dpms force off' -notify 10 -notifier 'notify-send -t 10000 "screensaver" "locking screen in 10 seconds!"' &
fi

# Big apps first, to speed up the concurrent loading
inPath keepass-cloud && keepass-cloud &

# Startup applications
inPath compton    && compton -b &
inPath parcellite && parcellite &
inPath devmon     && devmon-start &
inPath nm-applet  && nm-applet --sm-disable &
inPath redshift   && redshift-toggle on &
inPath rssowl     && rssowl -noSplash &
inPath gnome-encfs-manager && gnome-encfs-manager-remount &
