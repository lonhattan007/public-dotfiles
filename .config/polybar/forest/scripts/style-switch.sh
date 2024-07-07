#!/usr/bin/env bash

SDIR="$HOME/.config/polybar/forest/scripts"

THEMES=" Default| Nord| Gruvbox| Dark| Cherry"

# Launch Rofi
CHOSEN="$(echo -n $THEMES | \
		rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
		-theme $SDIR/rofi/styles.rasi)"

case "$CHOSEN" in
	*Default) "$SDIR"/styles.sh --default ;;
	*Nord) "$SDIR"/styles.sh --nord ;;
	*Gruvbox) "$SDIR"/styles.sh --gruvbox ;;
	*Dark) "$SDIR"/styles.sh --dark ;;
	*Cherry) "$SDIR"/styles.sh --cherry ;;
esac
