#! /usr/bin/bash

###FOR INTEL ONLY###

brightness="$(cat /sys/class/backlight/intel_backlight/brightness)"
maxBrightness="$(cat /sys/class/backlight/intel_backlight/max_brightness)"
jump=$(("$maxBrightness / 20"))
brightnessDifference=$(("$maxBrightness" - "$brightness"))
maxRange=$(("$maxBrightness" - "$jump"))

if [ "$brightness" - ge "$maxRange" ] && [ "$brightness" -le "$maxBrightness" ]
then
  echo $maxBrightness > /sys/class/backlight/intel_backlight/brightness

else
  brightness=$(("$brightness" + "$jump"))
  echo $brightness > /sys/class/backlight/intel_backlight/brightness
fi
