#!/bin/bash
if [[ $(bspc query -T -d | jq -r .layout) == "tiled" ]]
then
	echo ""
elif [[ $(bspc query -N -n .window -d focused | wc -l) -gt 1 ]]
then
	echo ""
elif [[ $(bspc query -N -n .window -d focused | wc -l) -eq 1 ]]
then
	echo ""
else
	echo ""
fi
