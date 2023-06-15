#!/usr/bin/env bash

SDIR="$HOME/.config/polybar/catppuccin/scripts"

# Launch Rofi
MENU="$(rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p '' \
-theme $SDIR/rofi/styles.rasi \
<<< " Latte| Frappe| Macchiato| Mocha|")"
            case "$MENU" in
				*Latte) "$SDIR"/styles.sh --latte ;;
				*Frappe) "$SDIR"/styles.sh --frappe ;;
				*Macchiato) "$SDIR"/styles.sh --macchiato ;;
				*Mocha) "$SDIR"/styles.sh --mocha ;;
            esac
