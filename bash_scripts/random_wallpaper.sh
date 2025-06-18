#!/bin/bash 

NUMBER=$(( 1 + $RANDOM % 4 ))

if [ $NUMBER == 1 ]; then 
  feh --bg-scale /home/moritz/Bilder/bus-stop.jpg /home/moritz/Bilder/bus-stop.jpg 
elif [ $NUMBER == 2 ]; then
  feh --bg-scale /home/moritz/Bilder/flowers.jpg /home/moritz/Bilder/flowers.jpg 
elif [ $NUMBER == 3 ]; then 
  feh --bg-scale /home/moritz/Bilder/skeleton.png /home/moritz/Bilder/skeleton.png
elif [ $NUMBER == 3 ]; then 
  feh --bg-scale /home/moritz/Bilder/souls_3.png /home/moritz/Bilder/souls_3.png
elif [ $NUMBER == 4 ]; then 
  feh --bg-scale /home/moritz/Bilder/snow.png /home/moritz/Bilder/snow.png
fi


