#!/bin/bash

CITY="$2"
TYPE="$1"

get_coords() {
    local city="$1"
    local response
    response=$(curl -s "https://geocoding-api.open-meteo.com/v1/search?name=${city}&fields=latitude,longitude")
    lat=$(echo "$response" | jq -r '.results[0].latitude')
    long=$(echo "$response" | jq -r '.results[0].longitude')
    echo "$lat $long"
}

get_weather() {
    local lat="$1"
    local long="$2"
    local response
    response=$(curl -s "https://api.open-meteo.com/v1/forecast?latitude=${lat}&longitude=${long}&current=temperature_2m,relative_humidity_2m,rain,wind_speed_10m,weathercode,relative_humidity_2m,wind_speed_10m,weathercode")
    temp=$(echo "$response" | jq -r '.current.temperature_2m')
    weathercode=$(echo "$response" | jq -r '.current.weathercode')
    humid=$(echo "$response " | jq -r ".current.relative_humidity_2m")
    wind_speed_10m=$(echo "$response " | jq -r ".current.wind_speed_10m")
    display_weather "$temp" "$weathercode" "$humid" "$wind_speed_10m"
}

display_weather() {
    local temp="$1"
    local weathercode="$2"
    local humid="$3"
    local wind_speed_10m="$4"

    case "$weathercode" in
        0|1) icon="󰖕 " ;;
        2)   icon=" " ;;
        3)   icon="󰖐 " ;;
        45|48) icon="󰖑 " ;;
        51|53|55|61|63|65|80|81|82) icon="󰖖 " ;;
        56|57|66|67) icon="󰖗 " ;;
        71|73|75|77|85|86) icon="󰖘 " ;;
        95|96|99) icon="󰖓 " ;;
        *)   icon="?" ;;
    esac

    if [[ $TYPE == "temp" ]]; then 
      echo "${temp}°C "
    elif [[ $TYPE == "json" ]]; then 
      echo "{\"text\": \"${temp}°C \", \"tooltip\": \"${icon}${temp}°C\nLuftfeuchtigkeit: ${humid}%\nWindgeschwindigkeit: ${wind_speed_10m}km/h\"}"
    fi

}

if [[ -n "$CITY" ]]; then 
  read -r lat long <<< "$(get_coords "$CITY")"
  get_weather "$lat" "$long"
else 
  echo "please provide a city. Example: temp Berlin"
fi



