#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

cache_file=~/.cache/polybar_theme
dir="~/.config/polybar/$(head -1 $cache_file)/scripts/rofi"

rofi -no-config -no-lazy-grab -show drun -modi drun -theme "$dir/launcher.rasi"
