#!/bin/sh

vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%')
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

fg0="^c#ff5555^─"
fg1="^c#ff7755^─"
fg2="^c#ff9955^─"
fg3="^c#ffbb55^─"
fg4="^c#ffdd55^─"
fg5="^c#ddff55^─"
fg6="^c#bbff55^─"
fg7="^c#99ff55^─"
fg8="^c#77ff55^─"
fg9="^c#55ff55^─"

fg99="^c#555555^─"

mt="^c#666666^MUTED"

vi="^d^|"
vn="^d^ ${vol}%"

if [ "$mute" = "yes" ]; then
    pulseaudio="${mt}"
elif [ "$mute" = "no" ] && [ "$vol" -lt "10" ]; then
    vn="^d^  ${vol}%"
    pulseaudio="${vi}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99} ${vn}"
elif [ "$mute" = "no" ] && [ "$vol" -lt "20" ]; then
    pulseaudio="${fg0}${vi}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99} ${vn}"
elif [ "$mute" = "no" ] && [ "$vol" -lt "30" ]; then
    pulseaudio="${fg0}${fg1}${vi}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99} ${vn}"
elif [ "$mute" = "no" ] && [ "$vol" -lt "40" ]; then
    pulseaudio="${fg0}${fg1}${fg2}${vi}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99} ${vn}"
elif [ "$mute" = "no" ] && [ "$vol" -lt "50" ]; then
    pulseaudio="${fg0}${fg1}${fg2}${fg3}${vi}${fg99}${fg99}${fg99}${fg99}${fg99}${fg99} ${vn}"
elif [ "$mute" = "no" ] && [ "$vol" -lt "60" ]; then
    pulseaudio="${fg0}${fg1}${fg2}${fg3}${fg4}${vi}${fg99}${fg99}${fg99}${fg99}${fg99} ${vn}"
elif [ "$mute" = "no" ] && [ "$vol" -lt "70" ]; then
    pulseaudio="${fg0}${fg1}${fg2}${fg3}${fg4}${fg5}${vi}${fg99}${fg99}${fg99}${fg99} ${vn}"
elif [ "$mute" = "no" ] && [ "$vol" -lt "80" ]; then
    pulseaudio="${fg0}${fg1}${fg2}${fg3}${fg4}${fg5}${fg6}${vi}${fg99}${fg99}${fg99} ${vn}"
elif [ "$mute" = "no" ] && [ "$vol" -lt "90" ]; then
    pulseaudio="${fg0}${fg1}${fg2}${fg3}${fg4}${fg5}${fg6}${fg7}${vi}${fg99}${fg99} ${vn}"
elif [ "$mute" = "no" ] && [ "$vol" -lt "100" ]; then
    pulseaudio="${fg0}${fg1}${fg2}${fg3}${fg4}${fg5}${fg6}${fg7}${fg8}${vi}${fg99} ${vn}"
else
    vn="^d^${vol}%"
    pulseaudio="${fg0}${fg1}${fg2}${fg3}${fg4}${fg5}${fg6}${fg7}${fg8}${fg9}${vi} ${vn}"
fi

echo "$pulseaudio"