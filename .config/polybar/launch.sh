#!/usr/bin/env bash

dir="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh" $dir`)

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

	# Launch the bar
	if [[ "$style" == "hack" || "$style" == "cuts" ]]; then
  		if type "xrandr"; then
			for m in $(polybar --list-monitors | cut -d" " -f1 | cut -d":" -f1); do
				MONITOR=$m polybar --reload -q top -c "$dir/$style/config.ini" &
				MONITOR=$m polybar --reload -q bottom -c "$dir/$style/config.ini" &
			done
		else
			polybar --reload -q top -c "$dir/$style/config.ini" &
			polybar --reload -q bottom -c "$dir/$style/config.ini" &
		fi
	else
		#polybar -q main -c "$dir/$style/config.ini" &	
		if type "xrandr"; then
			for m in $(polybar --list-monitors | cut -d" " -f1 | cut -d":" -f1); do
    			MONITOR=$m polybar --reload -q main -c "$dir/$style/config.ini" &
  			done
		else
  			polybar --reload -q main -c "$dir/$style/config.ini" &
		fi
	fi
}

if [[ "$1" == "--cuts" ]]; then
	style="cuts"
	launch_bar

elif [[ "$1" == "--forest" ]]; then
	style="forest"
	launch_bar

elif [[ "$1" == "--catppuccin" ]]; then
	style="catppuccin"
	launch_bar

else
	cat <<- EOF
	Usage : launch.sh --theme
		
	Available Themes :
	--cuts      --forest         --catppuccin
	EOF
fi
