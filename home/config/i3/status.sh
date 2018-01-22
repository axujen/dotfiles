#!/usr/bin/env sh

TIMEOUT=5
SEP="|"
sep(){
    echo "$SEP"
}

song(){
    if [ "$(mpc current)" ]; then
        mpc current
    else
        echo "N/A"
    fi
}


volume(){
    amixer get Master | awk -F"[][]" '/dB/ { print $2 }'
}

clock(){
    date "+%F %R"
}

i3status | while true; do
    echo "Volume: $(volume) $(sep) MPD: $(song) $(sep) $(clock) " || exit 1
    sleep "$TIMEOUT"
done
