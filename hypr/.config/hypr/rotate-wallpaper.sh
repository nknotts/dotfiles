#!/bin/bash

#set -x

current=$(swww query | cut -d ' ' -f 8-)

# randomly select a file that is not the current one
# try 10 times to avoid infinite loop
for i in $(seq 1 10); do
  file=$(ls ~/.config/wallpapers/* | shuf -n 1)

  if [ "$file" != "$current" ]; then
    break
  fi
done

# Do something with the random file
/usr/bin/echo "Selected file: $file"

export WAYLAND_DISPLAY=wayland-1
/usr/bin/swww img $file
