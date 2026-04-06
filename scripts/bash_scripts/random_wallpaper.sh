#!/bin/bash
BACKGROUNDS=(/home/moritz/.config/omarchy/current/theme/backgrounds/*)
RANDOM_BG=${BACKGROUNDS[$RANDOM % ${#BACKGROUNDS[@]}]}

uwsm-app -- swaybg -i "$RANDOM_BG" -m fill
