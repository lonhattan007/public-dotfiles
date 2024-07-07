#!/bin/sh
# !/usr/bin/env bash

# Script to lockscreen using i3lock with a random lockscreen image

SCREEN_0_SIZE=$(xrandr | grep ' connected' | grep -o '[0-9]\+x[0-9]\+' | head -n 1)
RANDOM_NUMBER=$(shuf -i 1-6 -n 1)

# when i3lock is done, execute the next command
i3lock -t -i "$HOME/OSsetup/Backgrounds/Lockscreens/lockscreen_${RANDOM_NUMBER}_${SCREEN_0_SIZE}.png"; 
ibus restart
