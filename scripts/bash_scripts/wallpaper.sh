#!/bin/bash 

WALLPAPER_DIR="/home/moritz/.config/omarchy/themes/gruvbox/backgrounds/"
WALLPAPER_PREVIEW_SIZE_WIDTH="80"
WALLPAPER_PREVIEW_SIZE_HEIGHT="50"

WALLPAPER_ARRAY=()

for image in $WALLPAPER_DIR*; do 
  WALLPAPER_ARRAY+=($image)
done


while true; do 

  SELECTED=$(gum choose "${WALLPAPER_ARRAY[@]}" "Exit" )

  if [[ "$SELECTED" -eq "Exit" ]]; then 
    exit
  fi
  
  if [[ -n "$SELECTED" ]]; then
    echo "GOT SELECTED WALLPAPER: " $SELECTED
    pkill swaybg 2>/dev/null
    /usr/bin/swaybg -i "$SELECTED" -m fill &
  fi
done
