# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
# 	continue
#     ;;
# esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Completion

source /etc/profile.d/bash_completion.sh


# Zoxide ---------------------------------------------------------------------

_z_cd() {
    cd "$@" || return "$?"

    if [ "$_ZO_ECHO" = "1" ]; then
        echo "$PWD"
    fi
}

z() {
    if [ "$#" -eq 0 ]; then
        _z_cd ~
    elif [ "$#" -eq 1 ] && [ "$1" = '-' ]; then
        if [ -n "$OLDPWD" ]; then
            _z_cd "$OLDPWD"
        else
            echo 'zoxide: $OLDPWD is not set'
            return 1
        fi
    else
        _zoxide_result="$(zoxide query -- "$@")" && _z_cd "$_zoxide_result"
    fi
}

zi() {
    _zoxide_result="$(zoxide query -i -- "$@")" && _z_cd "$_zoxide_result"
}


alias za='zoxide add'

alias zq='zoxide query'
alias zqi='zoxide query -i'

alias zr='zoxide remove'
zri() {
    _zoxide_result="$(zoxide query -i -- "$@")" && zoxide remove "$_zoxide_result"
}


_zoxide_hook() {
    if [ -z "${_ZO_PWD}" ]; then
        _ZO_PWD="${PWD}"
    elif [ "${_ZO_PWD}" != "${PWD}" ]; then
        _ZO_PWD="${PWD}"
        zoxide add "$(pwd -L)"
    fi
}

case "$PROMPT_COMMAND" in
    *_zoxide_hook*) ;;
    *) PROMPT_COMMAND="_zoxide_hook${PROMPT_COMMAND:+;${PROMPT_COMMAND}}" ;;
esac


# SSH ------------------------------------------------------------------------
# eval $(/usr/bin/gnome-keyring-daemon --start --components=ssh)

# For some minimal WSL distros, require the `keyring` package
# /usr/bin/keychain -q --nogui $HOME/.ssh/wsl-suse
# source $HOME/.keychain/$HOST-sh


# Git ------------------------------------------------------------------------
alias g="git"


# AWS ------------------------------------------------------------------------
complete -C '/usr/local/bin/aws_completer' aws


# nvm ------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export PATH="$PATH:$HOME/.nvm/versions/node/**/bin"


# Deno -----------------------------------------------------------------------
export DENO_INSTALL="/home/nhattan/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"


# Android Sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH="$PATH:$HOME/Android/Sdk"
# Android Studio Emulator
export PATH="$PATH:$ANDROID_HOME/emulator"
# Android Debug Bridge
export PATH="$PATH:$ANDROID_HOME/platform-tools"


# Flutter --------------------------------------------------------------------
export PATH="$PATH:$HOME/.local/bin/flutter/bin"
# Dart pub
export PATH="$PATH":"$HOME/.pub-cache/bin"


# Python 3 -------------------------------------------------------------------
alias python="python3"

# Conda ----------------------------------------------------------------------

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/nhattan/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/nhattan/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/nhattan/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/nhattan/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

export CONDA_ACTIVATE_PATH="$HOME/anaconda3/bin/activate"
alias conda-init="source $CONDA_ACTIVATE_PATH && conda init"


# Golang ---------------------------------------------------------------------
export PATH="$PATH:$HOME/.local/bin/go/bin"
export PATH="$PATH:$HOME/go/bin"


# Rust -----------------------------------------------------------------------
export PATH="$PATH:$HOME/.cargo/bin"


# Swift
# export PATH="$HOME/.local/bin/swift/bin:$PATH"


# Texlive --------------------------------------------------------------------
# export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
# MikTex
export PATH="$HOME/bin:$PATH"


# ANTLR4 ---------------------------------------------------------------------
# export ANTLR_JAR="$HOME/.local/lib/antlr-4.9.2-complete.jar"
# alias antlr4='java -Xmx500M -cp "$HOME/.local/lib/antlr-4.9.2-complete.jar:$ANTLR_JAR" org.antlr.v4.Tool'
# alias grun='java -Xmx500M -cp "$HOME/.local/lib/antlr-4.9.2-complete.jar:$ANTLR_JAR" org.antlr.v4.gui.TestRig'
# export CLASSPATH=".:$HOME/.local/lib/antlr-4.9.2-complete.jar":$CLASSPATH
# alias antlr4='java -jar /usr/local/lib/antlr-4.9.2-complete.jar'
# alias grun='java org.antlr.v4.gui.TestRig'


# Spicetify ------------------------------------------------------------------
alias spicefify="$HOME/.spicetify/spicetify"
export PATH="$PATH:$HOME/.spicetify"


# Aliases & terminal stuffs ---------------------------------------------------

# Web search from zsh
alias gg=google

# nvim
alias vim='nvim'

# Polybar launcher
alias polybar-launch="$HOME/.config/polybar/launch.sh"

# i3 layout manager
alias layout_manager="$HOME/.config/i3/layout_manager.sh"

# postman
alias postman='flatpak run com.getpostman.Postman'

# insomnia
alias insomnia='flatpak run rest.insomnia.Insomnia'

# onlyoffice
alias onlyoffice='flatpak run org.onlyoffice.desktopeditors'

# sioyek
alias sioyek='flatpak run com.github.ahrm.sioyek'

# matrix
alias matrix='reset && cmatrix'

# cbonsai on dashboard
alias bonsai='cbonsai -li -L 19'

# tty-clock on dashboard
alias clock='tty-clock -cD'

# Timeshift-gtk
alias timeshift-gtk='pkexec timeshift-gtk'

# lazygit
alias lg='lazygit'

# pfetch
# Enable color in output: 0/1
export PF_COLOR=1
# Color of info names: 0-9
export PF_COL1=4
# Color of info data: 0-9
export PF_COL2=9
# Color of title data: 0-9
export PF_COL3=3
# Ascii art to use
export PF_ASCII="Catppuccin"

# pipes
#alias pipes='pipes.sh'

# Ranger highlight
export HIGHLIGHT_STYLE=clarity

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# SDKMan ---------------------------------------------------------------------
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
. "$HOME/.cargo/env"


# Starship prompt
eval "$(starship init bash)"


# Bash startup ----------------------------------------------------------------

# Pywal
# reset
#wal -Rnq

# Treefetch
if [[ $(tput lines) -ge 13 ]] && [[ $(tput cols) -ge 51 ]]; 
then
	clear

	random=$(shuf -i 1-3 -n 1)
	if [ $random -eq 1 ]
	then
		treefetch -x
	elif [ $random -eq 2 ]
	then
		treefetch -b
	else
		pfetch
	fi
fi
# clear && treefetch -b

