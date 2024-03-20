#! /usr/bin/bash

###FOR INTEL ONLY###

brightness="$(cat /sys/class/backlight/intel_backlight/brightness)"
jump=$((("$(cat /sys/class/backlight/intel_backlight/max_brightness)") / 20))

if [ "$brightness" -ge 0 ] && [ "$brightness" -le "$jump" ]
then
  echo 0 > /sys/class/backlight/intel_backlight/brightness

else
  brightness=$(("$brightness" - "$jump"))
  echo $brightness > /sys/class/backlight/intel_backlight/brightness
fi
