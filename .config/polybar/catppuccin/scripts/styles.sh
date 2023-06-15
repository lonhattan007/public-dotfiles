#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/catppuccin/colors.ini"
RFILE="$HOME/.config/polybar/catppuccin/scripts/rofi/colors.rasi"

# Change colors
change_color() {
	# polybar
	sed -i -e "s/background = #.*/background = $BASE/g" $PFILE
	sed -i -e "s/background-alt = #.*/background-alt = #EE${BASE:1}/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $TEXT/g" $PFILE
	sed -i -e "s/sep = #.*/sep = $SURFACE1/g" $PFILE

	sed -i -e "s/base = #.*/base = $BASE/g" $PFILE
	sed -i -e "s/mantle = #.*/mantle = $MANTLE/g" $PFILE
	sed -i -e "s/crust = #.*/crust = $CRUST/g" $PFILE

	sed -i -e "s/text = #.*/text = $TEXT/g" $PFILE
	sed -i -e "s/subtext1 = #.*/subtext1 = $SUBTEXT1/g" $PFILE
	sed -i -e "s/subtext2 = #.*/subtext2 = $SUBTEXT2/g" $PFILE

	sed -i -e "s/surface0 = #.*/surface0 = $SURFACE0/g" $PFILE
	sed -i -e "s/surface1 = #.*/surface1 = $SURFACE1/g" $PFILE
	sed -i -e "s/surface2 = #.*/surface2 = $SURFACE2/g" $PFILE

	sed -i -e "s/overlay0 = #.*/overlay0 = $OVERLAY0/g" $PFILE
	sed -i -e "s/overlay1 = #.*/overlay1 = $OVERLAY1/g" $PFILE
	sed -i -e "s/overlay2 = #.*/overlay2 = $OVERLAY2/g" $PFILE

	sed -i -e "s/blue = #.*/blue = $BLUE/g" $PFILE
	sed -i -e "s/lavender = #.*/lavender = $LAVENDER/g" $PFILE
	sed -i -e "s/sapphire = #.*/sapphire = $SAPPHIRE/g" $PFILE
	sed -i -e "s/sky = #.*/sky = $SKY/g" $PFILE
	sed -i -e "s/teal = #.*/teal = $TEAL/g" $PFILE
	sed -i -e "s/green = #.*/green = $GREEN/g" $PFILE
	sed -i -e "s/yellow = #.*/yellow = $YELLOW/g" $PFILE
	sed -i -e "s/peach = #.*/peach = $PEACH/g" $PFILE
	sed -i -e "s/maroon = #.*/maroon = $MAROON/g" $PFILE
	sed -i -e "s/red = #.*/red = $RED/g" $PFILE
	sed -i -e "s/mauve = #.*/mauve = $MAUVE/g" $PFILE
	sed -i -e "s/pink = #.*/pink = $PINK/g" $PFILE
	sed -i -e "s/flamingo = #.*/flamingo = $FLAMINGO/g" $PFILE
	sed -i -e "s/rosewater = #.*/rosewater = $BASE/g" $PFILE

	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:   #00000000;
	  bg:   ${SURFACE0}FF;
	  bga:  ${BASE}FF;
	  fg:   ${TEXT}FF;
	  ac:   ${MAROON}FF;
	  se:   ${SKY}FF;
	}
	EOF
	
	polybar-msg cmd restart
}

if  [[ $1 = "--frappe" ]]; then
	BASE=#303446
	MANTLE=#292c3c
	CRUST=#232634
	
	TEXT=#c6d0f5
	SUBTEXT0=#a5adce
	SUBTEXT1=#b5bfe2
	
	SURFACE0=#414559
	SURFACE1=#51576d
	SURFACE2=#626880
	 
	OVERLAY0=#737994
	OVERLAY1=#838ba7
	OVERLAY2=#949cbb
	 
	BLUE=#8caaee
	LAVENDER=#babbf1
	SAPPHIRE=#85c1dc
	SKY=#99d1db
	TEAL=#81c8be
	GREEN=#a6d189
	YELLOW=#e5c890
	PEACH=#ef9f76
	MAROON=#ea999c
	RED=#e78284
	MAUVE=#ca9ee6
	PINK=#f4b8e4
	FLAMINGO=#eebebe
	ROSEWATER=#f2d5cf

	change_color
elif  [[ $1 = "--latte" ]]; then
	BASE=#eff1f5
	MANTLE=#e6e9ef
	CRUST=#dce0e8
	
	TEXT=#4c4f69
	SUBTEXT0=#6c6f85
	SUBTEXT1=#5c5f77
	
	SURFACE0=#ccd0da
	SURFACE1=#bcc0cc
	SURFACE2=#acb0be
	 
	OVERLAY0=#9ca0b0
	OVERLAY1=#8c8fa1
	OVERLAY2=#7c7f93
	 
	BLUE=#1e66f5
	LAVENDER=#7287fd
	SAPPHIRE=#209fb5
	SKY=#04a5e5
	TEAL=#179299
	GREEN=#40a02b
	YELLOW=#df8e1d
	PEACH=#fe640b
	MAROON=#e64553
	RED=#d20f39
	MAUVE=#8839ef
	PINK=#ea76cb
	FLAMINGO=#dd7878
	ROSEWATER=#dc8a78
	
	change_color
elif  [[ $1 = "--mocha" ]]; then
	BASE=#1e1e2e
	MANTLE=#181825
	CRUST=#11111b
	
	TEXT=#cdd6f4
	SUBTEXT0=#a6adc8
	SUBTEXT1=#bac2de
	
	SURFACE0=#313244
	SURFACE1=#45475a
	SURFACE2=#585b70
	 
	OVERLAY0=#6c7086
	OVERLAY1=#7f849c
	OVERLAY2=#9399b2
	 
	BLUE=#89b4fa
	LAVENDER=#b4befe
	SAPPHIRE=#74c7ec
	SKY=#89dceb
	TEAL=#94e2d5
	GREEN=#a6e3a1
	YELLOW=#f9e2af
	PEACH=#fab387
	MAROON=#eba0ac
	RED=#f38ba8
	MAUVE=#cba6f7
	PINK=#f5c2e7
	FLAMINGO=#f2cdcd
	ROSEWATER=#f5e0dc
	
	change_color
elif  [[ $1 = "--macchiato" ]]; then
	BASE=#24273a
	MANTLE=#1e2030
	CRUST=#181926
	
	TEXT=#cad3f5
	SUBTEXT0=#a5adcb
	SUBTEXT1=#b8c0e0
	
	SURFACE0=#363a4f
	SURFACE1=#494d64
	SURFACE2=#5b6078
	 
	OVERLAY0=#6e738d
	OVERLAY1=#8087a2
	OVERLAY2=#939ab7
	 
	BLUE=#8aadf4
	LAVENDER=#b7bdf8
	SAPPHIRE=#7dc4e4
	SKY=#91d7e3
	TEAL=#8bd5ca
	GREEN=#a6da95
	YELLOW=#eed49f
	PEACH=#f5a97f
	MAROON=#ee99a0
	RED=#ed8796
	MAUVE=#c6a0f6
	PINK=#f5bde6
	FLAMINGO=#f0c6c6
	ROSEWATER=#f4dbd6
	
	change_color
else
	cat <<- _EOF_
	No option specified, Available options:
	--default    --frappe    --latte    --mocha    --macchiato
	_EOF_
fi
