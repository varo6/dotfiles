#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit
# Detect battery and AC adapter
export BATTERY=$(ls /sys/class/power_supply/ | grep BAT | head -n 1)
export ADAPTER=$(ls /sys/class/power_supply/ | grep -E '(AC|ACAD)' | head -n 1)
# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar first 2>&1 | tee -a /tmp/polybar.log & disown
polybar center 2>&1 | tee -a /tmp/polybar.log & disown
polybar right 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
