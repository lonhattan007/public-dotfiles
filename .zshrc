# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=30
#
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#
# Keybindings
# Use -v for vi mode, -e for emacs mode
bindkey -v

# Using emacs mode
# bindkey -e

# ctrl+backspace to delete a word
bindkey "^H" backward-delete-word

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
#(cat ~/.cache/wal/sequences &)

# Editor ---------------------------------------------------------------------

VIM=""
export PATH="/opt/nvim-linux64/bin:/opt/nvim-linux-x86_64/bin:$PATH"
if [[ $(which nvim) == "nvim not found" ]];
then
	VIM=vim
else
	VIM=nvim
fi

alias vim=$VIM

export VISUAL=$VIM
export EDITOR=$VIM


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
    zoxide add "$(pwd -L)"
}

chpwd_functions=(${chpwd_functions[@]} "_zoxide_hook")


# SSH ------------------------------------------------------------------------

# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
#     source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi


# GPG ------------------------------------------------------------------------
export GPG_TTY=$(tty)


# Some more ls aliases -------------------------------------------------------
alias ls='ls --color'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -C'


# Git ------------------------------------------------------------------------
alias g="git"


# AWS ------------------------------------------------------------------------
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws


# nvm ------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
# This loads nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
export PATH="$PATH:$HOME/.nvm/versions/node/**/bin"

# Auto load proper node version when there's a `.nvmrc`
autoload -U add-zsh-hook
load-nvmrc() {
  [[ -a .nvmrc ]] || return

  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc


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
export PATH="$PATH:/usr/local/go/bin"


# Rust -----------------------------------------------------------------------
export PATH="$PATH:$HOME/.cargo/bin"


# Swift
export PATH="$HOME/.local/bin/swift/bin:$PATH"


# Rancher
export PATH="$PATH:$HOME/.rd/bin"

# K8s
alias k8s=kubectl


# Texlive
# export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"
# MikTex
export PATH="$HOME/bin:$PATH"


# Spicetify ------------------------------------------------------------------
alias spicefify="$HOME/.spicetify/spicetify"
export PATH="$PATH:$HOME/.spicetify"


# Aliases & terminal stuffs ---------------------------------------------------

# Web search from zsh
alias gg=google

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

# lazydocker
alias ld='lazydocker'

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

# Other binaries
export PATH="$HOME/.local/bin:$PATH"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh || eval "$(fzf --zsh)"
# For newest versions
# eval "$(fzf --zsh)"
FZF_KEYBINDINGS="tab:down,btab:up,alt-j:toggle+down,alt-k:toggle+up,alt-down:toggle+down,alt-up:toggle+up,"
FZF_KEYBINDINGS="${FZF_KEYBINDINGS}ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up,ctrl-f:preview-page-down,ctrl-b:preview-page-up"
[ -f ~/.fzf.git.sh ] && source ~/.fzf.git.sh
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}' --bind=${FZF_KEYBINDINGS}"


# SDKMan ---------------------------------------------------------------------
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Starship prompt
eval "$(starship init zsh)"


# Clipboard ------------------------------------------------------------------
# pc for pasteboard copy
# pp for pasteboard paste
if [[ "$(uname)" == "Linux" ]];
then
    alias pc="xclip -selection c"
    alias pp="xclip -selection c -o"
elif [[ "$(uname)" == "Darwin" ]];
then
    alias pc="pbcopy"
    alias pp="pbpaste"
fi


# ZSH startup ----------------------------------------------------------------

# Pywal
# reset
#wal -Rnq

# Treefetch
# if [[ $(tput lines) -ge 21 && $(tput cols) -ge 51 ]];
# then
clear

# random=$(shuf -i 1-3 -n 1)
# if [ $random -eq 1 ]
# then
# 	treefetch -x
# elif [ $random -eq 2 ]
# then
# 	treefetch -b
# else
# 	pfetch
# fi

