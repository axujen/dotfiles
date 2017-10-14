# vim: ft=sh
# This script is executed once after the user logs in
# Used instead of @reboot cron jobs

# Must explicitly enable this file by running touch ~/.shellrc/start
if [ ! -f "$HOME/.shellrc/start" ]; then
    return
fi

# This is a hack, basically create a file in /tmp after the user logs in
# and use it to check if this script was ran before.
# This should not cause problems as long as nothing is clearing
# /tmp while the system is running.
if [ -f "/tmp/has-logged/$USER" ]; then
	return
else
	[ ! -d /tmp/has-logged ] && mkdir /tmp/has-logged
	touch "/tmp/has-logged/$USER"
fi


# Manage tmp dir inside $HOME
HOMETMP="$HOME"/tmp
if [ -e "$HOMETMP" ]; then rm -rf "$HOMETMP"; fi # just delete it and recreate
mkdir "$HOMETMP"


# Delete trash dotfiles
TRASH="
$HOME/.xsession-errors
$HOME/.histfile 
$HOME/.bash_history 
$HOME/.lesshst 
$HOME/.viminfo
"
for file in $TRASH; do rm "$file"; done
