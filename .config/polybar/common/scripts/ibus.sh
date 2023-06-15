#!/bin/bash

engine=$(ibus engine)

#ENGLISH="xkb:us::eng"
ENGLISH="BambooUs"
VIETNAM="Bamboo"

if [[ "$engine" == "$ENGLISH" ]]; then
    echo "EN"
else
    echo "VI"
fi
