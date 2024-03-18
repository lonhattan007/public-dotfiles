#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

uptime=$(uptime -p | sed -e 's/up //g')
cache_file=~/.cache/polybar_theme
dir="~/.config/polybar/$(head -1 $cache_file)/scripts/rofi"

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown=" Shutdown"
reboot=" Restart"
lock=" Lock"
suspend=" Sleep"
logout=" Logout"

#Screen size
SCREEN_0_SIZE="1920x1080"

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		-theme $dir/confirm.rasi
}

# Message
msg() {
	rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl poweroff
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $reboot)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
			systemctl reboot
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $lock)
		if [[ "$DESKTOP_SESSION" == "pop" || "$DESKTOP_SESSION" == "gnome" || $DESKTOP_SESSION == "cinnamon" ]]; then
			xdg-screensaver lock
		elif [[ -f /usr/bin/i3lock ]]; then
			$HOME/.config/polybar/common/scripts/lockscreen.sh
		elif [[ -f /usr/bin/betterlockscreen ]]; then
			betterlockscreen -l
		fi
        ;;
    $suspend)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" || $ans == "" ]]; then
			mpc -q pause
			amixer set Master mute
			xdg-screensaver lock
			systemctl suspend
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        else
			msg
        fi
        ;;
    $logout)
		if [[ "$DESKTOP_SESSION" == "pop" || "$DESKTOP_SESSION" == "gnome" || "$DESKTOP_SESSION" == "gnome-xorg" ]]; then
			gnome-session-quit --logout
		elif [[ "$DESKTOP_SESSION" == "cinnamon" ]]; then
			cinnamon-session-quit --logout
		else
			ans=$(confirm_exit &)
			if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" || $ans == "" ]]; then
				if [[ "$DESKTOP_SESSION" == "Openbox" ]]; then
					openbox --exit
				elif [[ "$DESKTOP_SESSION" == "bspwm" ]]; then
					bspc quit
				elif [[ "$DESKTOP_SESSION" == "i3" ]]; then
					i3-msg exit
				else
					loginctl kill-session $XDG_SESSION_ID
				fi
			elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
				exit 0
    		else
				msg
    		fi
		fi
		;;
esac
