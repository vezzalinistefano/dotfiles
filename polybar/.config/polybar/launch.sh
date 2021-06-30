#!/usr/bin/env bash

# Terminate already running bar istances
killall -q polybar

# Launch polybar
echo "---" | tee -a /tmp/polybar1.log
polybar bspwm --config='~/.config/polybar/config.ini' 2>&1 | tee -a /tmp/polybar1.log & disown

echo "Bars launched..."
