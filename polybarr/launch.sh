#Crea un launch.sh
#nano ~/.config/polybar/launch.sh

# Pega esto en el nano launch:

#!/usr/bin/env bash

killall -q polybar

while pgrep -u "$UID" -x polybar >/dev/null; do
    sleep 1
done

polybar main &

# darle permisos
chmod +x ~/.config/polybar/launch.sh
