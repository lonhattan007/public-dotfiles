#!/usr/bin/env bash

SDIR="$HOME/.config/polybar/cuts/scripts"

THEMES=" Black| Adapta| Dark| Red| Green| Teal| Gruvbox| Nord| Solarized| Cherry"

# Launch Rofi
CHOSEN="$(echo -n $THEMES | \
		rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
		-theme $SDIR/rofi/styles.rasi)"

case "$CHOSEN" in
	*Black) "$SDIR"/styles.sh --mode1 ;;
	*Adapta) "$SDIR"/styles.sh --mode2 ;;
	*Dark) "$SDIR"/styles.sh --mode3 ;;
	*Red) "$SDIR"/styles.sh --mode4 ;;
	*Green) "$SDIR"/styles.sh --mode5 ;;
	*Teal) "$SDIR"/styles.sh --mode6 ;;
	*Gruvbox) "$SDIR"/styles.sh --mode7 ;;
	*Nord) "$SDIR"/styles.sh --mode8 ;;
	*Solarized) "$SDIR"/styles.sh --mode9 ;;
	*Cherry) "$SDIR"/styles.sh --mode10 ;;
esac
