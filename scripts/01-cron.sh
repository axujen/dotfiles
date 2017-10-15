## vim: ft=sh fdm=marker
## cron.sh: this script will restore a backed up cron file at res/cron
## make sure to keep keep res/cron updated

if [ ! "$(command -v crontab)" ]; then echo "crontab not found, install cron first!"; exit 1; fi
TEMP=$(mktemp) || TEMP=/tmp
BASEDIR="$(dirname "$(realpath "$0")")"
CRONFILE="$BASEDIR"/res/cron

if [ -r "$CRONFILE" ]; then
    # TODO: Ask if we want to overwrite or append, also display the current crontab to check
    crontab -l > "$TEMP"
    cat "$CRONFILE" >> "$TEMP"
    crontab "$TEMP"
else
    echo "could not read $CRONFILE"
fi
