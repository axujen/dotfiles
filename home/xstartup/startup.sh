## vim: ft=sh
## ~/.xstartup/startup.sh: starts gui applications after the wm
## don't execute this file directly, use ~/.xstartup/init to make sure 
## its loaded once per xorg session. if you execute this directly in the
## wm, you will execute duplicates if you use the WM/DE restart function
## NOTE: use the inPath function definied in init to check if a binary exists in $PATH
exec 2>&1

STARTUP="
xcompmgr -nC
parcellite
udiskie --smart-tray --file-manager=ranger
nm-applet --sm-disable
redshift-toggle on
quiterss
kdeconnect-indicator
xset s 60 60

megasync
keepassx
keepassxc
syncthing --no-browser
"

# Screensaver
if inPath xautolock; then
    inPath i3lock && xautolock -time 10 -locker 'i3lock -fc 000000; ( sleep 1 && xset dpms force off )' -notify 10 -notifier 'notify-send -t 10000 "screensaver" "locking screen in 10 seconds!"' &
fi


# Actual starting logic, that checks if the executable exists
start(){
    CMD="${1:-}"
    BIN="$(echo "$CMD" | awk '{print $1;}')"
    if inPath "$BIN" > /dev/null 2>&1; then
        echo "Starting $BIN"
        eval "$CMD &"
    fi
}

IFS="$(printf '%b_' '\n')"; IFS="${IFS%_}"
for CMD in $STARTUP; do
    start "$CMD"
done
