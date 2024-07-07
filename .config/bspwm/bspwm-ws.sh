#!/usr/bin/env bash

SDIR="$HOME/rofi-settings-menu/scripts"

rename_desktops_all_monitors() {
	declare -a monitors
	declare -a desktop_groups

	state=$( bspc wm -d | jq -r '.monitors' ) 
	no_of_monitors=$( echo $state | jq length )

	# primary monitor set to the first element in the array 
	monitors[1]=$( xrandr | grep primary | awk '{ print $1 }' )

	for i in $( seq 1 $(( $no_of_monitors )) ); do
		monitors[$((i+1))]=$( echo $state | jq -r ".[$((i-1))].name" )
	done

	desktops_count=0

	for i in $( seq 1 $(( $no_of_monitors + 1 )) ); do
		if [[ $i > 1 && ${monitors[$i]} = ${monitors[1]} ]]; then
			continue
		else
			cmd="bspc monitor ${monitors[$i]} -d"
			no_of_desktops=$( echo $state | jq -r ".[$((i-1))].desktops | length" )

			for j in $( seq 1 $no_of_desktops ); do
				cmd+=" ${monitors[$i]}_d$((++desktops_count))"
			done
			
			$cmd
		fi
	done	
}

init_desktops() {
	INTERNAL_MONITOR="eDP-1"
	# External monitor can be either HDMI, DP-1, DP-2, or empty
	EXTERNAL_MONITOR=$(xrandr -q | grep -w "connected" | sed -n 2p | cut -d' ' -f1)

	# The external monitor's desktops must be declared before the internal monitor
	# in case of it being empty, the bspc command will assume it to be the only monitor left.
	# We can the redeclare the desktops in the internal monitor.

	init_desktop_per_monitor() {
		monitor=$1
		start=$2
		end=$3

		CMD="bspc monitor $monitor -d "
		for i in $( seq $start $end ); do
			CMD+=" ${monitor}_d$i"
		done

		$CMD
	}

	init_desktop_per_monitor $INTERNAL_MONITOR 1 5
	[[ $EXTERNAL_MONITOR -ne "" ]] && \
			init_desktop_per_monitor $EXTERNAL_MONITOR 6 10

	# init_desktop_per_monitor eDP-1 1 4
	# init_desktop_per_monitor HDMI-1 5 8
	# init_desktop_per_monitor DP-1 9 10
}

add_desktop() {
	bspc monitor -f -a "new_ws" &&

	rename_desktops_all_monitors
}

remove_current_desktop() {
	bspc desktop -r

	rename_desktops_all_monitors 
}

pick_remove_desktop() {
	OPTIONS="$( bspc query -D --names | sed ':a;N;$!ba;s/\n/|/g' )" 

	DESKTOP_TO_REMOVE="$( echo -n $OPTIONS | \
			rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p "Current monitor: " \
			-theme $SDIR/rofi/workspaces.rasi )"

	bspc desktop "$DESKTOP_TO_REMOVE" -r

	rename_desktops_all_monitors
}

bspwm_workspace_menu() {
	OPTIONS=" Add workspace| Remove workspace" 
 
	ACTION="$( echo -n $OPTIONS | \
			rofi -no-config -no-lazy-grab -sep "|" -dmenu -i -p "Workspaces" \
			-theme $SDIR/rofi/workspaces.rasi )"

	case "$ACTION" in
		*"Add workspace")
			add_desktop
			;;
		*"Remove workspace")
			pick_remove_desktop
			;;
	esac
}

print_manual() {
	echo "Usage: bspwm-ws.sh <option>"
	echo "    Options: only one of the following"
	echo "        --help:		Print out the manual"
	echo "        --add:		Add a workspace"
	echo "        --remove:	Remove current workspace"
	echo "        --remove-menu:	Select a workspace to remove from a displayed list"
}

case "$1" in
	"--rofi")
		bspwm_workspace_menu
		;;
	"--add")
		add_desktop
		;;
	"--remove")
		remove_current_desktop
		;;
	"--remove-menu")
		pick_remove_desktop
		;;
	"--init")
		init_desktops
		;;
	"--help")
		print_manual
		;;
	*)
		print_manual
		;;
esac
