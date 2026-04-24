#!/bin/bash

WALLPAPER_DIR="$HOME/Wallpapers/"


WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( \
  -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \
\) | shuf -n 1)

[ -z "$WALLPAPER" ] && exit 1

pkill swaybg 2>/dev/null

/usr/bin/swaybg -i "$WALLPAPER" -m fill &

