#!/bin/bash

cd "$(dirname "$0")" || exit 1

selected_symbol="$(./charpickerprint.sh)"

if [ $? -ne 0 ]; then
    exit 1
fi

if ! command -v "wl-copy" &> /dev/null
then
  xdotool type --delay 100 "$selected_symbol"
else
  echo -n "$selected_symbol" | wl-copy
fi
