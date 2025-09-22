#!/bin/sh

updateNordBar() { 
    xsetroot -name "$(printf '%s %s' "$(~/.local/share/dwm-gab/nordbar/modules/pulseaudio.sh)" "$(~/.local/share/dwm-gab/nordbar/modules/separator.sh)")" 
}

updateNordBar

pactl subscribe | while read -r line; do
    case "$line" in
        *"sink"*) updateNordBar ;;
    esac
done