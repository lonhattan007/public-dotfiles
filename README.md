# Public Dotfiles

This repo includes dotfiles for my Linux `bspwm` setup, used alongside the Cosmic Desktop Environment. Currently operating and tested on Pop!OS 22.04 LTS (Ubuntu  22.04 based). I have only used Debian based distros so if you're on a non-Debian-based one, forgive me if you're using others. The configs fit my workflow, so feel free to tweak it to fit yours.

## Prerequisites

- Shell: zsh, oh-my-zsh, powerlevel10k
- Terminal: kitty
- SCM: git
- WM: bspwm
- Compositor: picom
- Status bar: polybar
- Menu launcher: rofi
- Noti-daemon: dunst
- Text editor: neovim nightly (> 0.10)
- Vim-plug (or any vim plugin manager of your preference)
- Terminal multiplexer: tmux (optional)
- tpm (tmux plugin manager, optional)
- OS fetch: treefetch (requires Cargo, optional)

## Manual Installation Roadmap

- Put all of the dotfiles in the right directories.
- This repo should be cloned in user's home directory (`~`)

### Git and package managers

- Install git:
	
	**Debian/Ubuntu/Linux Mint/Pop! OS:**
  ```bash
  sudo apt install git
  ```

- Create and add SSH key to Github profile
	- Use ```ssh-add <path to ssh key file>``` (`--apple-use-keychain` option in Mac/OSX so the SSH agent won't ask for the identity and passphrase later).

- Python3 & pip (might be shipped with some distros):

	**Debian/Ubuntu/Linux Mint/Pop! OS:**
	
  ```bash
  sudo apt install python3 python3-pip python3-venv
  ```

- Javascript/Typescript & nvm:
 
  ```bash
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
  nvm install 'lts/*'
  ```

- Rust & cargo:
 
  ```bash
  curl --proto '=https' --tlsv1.2 -sSf "https://sh.rustup.rs" | sh
  sudo apt install cargo
  ```

- Lua:

	**Debian/Ubuntu/Linux Mint/Pop! OS:**
 
  ```bash
  sudo apt install lua5.3
  ```

### Terminal stuffs:

- Cargo packages:
 
  ```bash
  cargo install --git https://github.com/angelofallars/treefetch
  cargo install git-delta
  ```

- Additional packages from github: oh-my-zsh + zsh plugins, vim-plug + vim plugins, tpm + tmux plugins, cbonsai, pfetch, gotop, spicetify, etc.
 
  - oh-my-zsh:
 
    ```bash
    chsh -s $(which zsh) # requires re-login to take effect
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    ```
 
  - vim-plug:
 
    ```bash
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    ```

  - tmux plug-in manager:

  	```bash
  	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
		tmux source ~/.tmux.conf
  	```
### WM / DE setup:

- Fonts: JetBrainsMono NerdFont (get from the NerdFont's repo), feather and iosevka NerdFont (get from [this repo's installation or assets](https://github.com/adi1090x/polybar-themes))

- Mouse cursors: Volantes cursor - follow [this instruction](https://github.com/varlesh/volantes-cursors)

- Icons: [Fluent-red-dark](https://github.com/vinceliuice/Fluent-icon-theme), [Nordzy](https://github.com/alvatip/Nordzy-icon)

- Themes: Sweet, Eleganse (Cinnamon)

  - polybar: follow [this instruction](https://github.com/polybar/polybar#installation)

    - Themes setup: follow [this instruction](https://github.com/adi1090x/polybar-themes#installation), then replace the `~/.config/polybar` folder with the ones in this repo; or: just install the fonts in this repo.

  - Monitor light control: my dotfiles use the `light` package, then add user to the `video` group

    ```bash
    sudo usermod -aG video $USER
    ```

### Vim configuration:

- Install some dependencies for neovim:

	**Debian/Ubuntu/Linux Mint/Pop! OS:**
	
	```bash
	sudo apt install xclip wl-copy wl-paste latexmk texlive texlive-lang-other
	```

	**Other OS-independent package managers:**

	```bash
	pip install neovim black
	cargo install stylua
	npm install -g prettier tree-sitter-cli
	```
- Open Vim and run `:PI`
- Reload Vim

### Tmux configuration:

- Open Tmux and run `<prefix> + I` (prefix should be `Ctrl + A`)
- Reload Tmux

## Some bspwm notes

My bspwm configs come with some following keymaps:

- `Super + h, j, k, l` moves between windows in a desktop
- `Super + Shift + h, j, k, l` switches windows in a desktop
- `Alt + (Shift) + Tab` cycles through windows in the current desktop in monocle layout
- `Super + (Shift) + Tab` cycles through active desktops
- `Super + f` triggers fullscreen mode
- `Super + t` triggers tiled mode
- `Super + s` triggers floating mode
- `Super + m` triggers monocle layout
- `Super + $number` switches to the $number-th desktop
- `Super + Shift + $number` moves the focused window to the $number-th desktop
- `Alt + d` launches Rofi launcher
- `Super + Shift + q` or `Alt + F4` kills the focused window
- `Super + Shift + e` launches the powermenu

## Some Nvim notes

- This nvim configuration also works on Windows (at least Windows 11)
- I have lots of custom keymaps, check them out with `WhichKey`, mostly from `keymaps.lua`
- Plugins are listed in `plugins.lua`
- Each time you change the colorscheme, it is saved to a cache file for loading in the next times
- If Nvim is called in a tmux session, its colorscheme will be catppuccin and themes won't be cached. This is because tmux uses catppuccin and currently I don't know how to dynamically change tmux themes.
- To automatically install some favored LSPs, linters, formatters, uncomment them in `lsp_options.lua` and `null_ls.lua`

## Thanks to

- [@adi1090x](https://github.com/adi1090x) and his [polybar-themes](https://github.com/adi1090x/polybar-themes) for the template and many presets I use in my polybar configs.
- [chist@machine](https://www.chrisatmachine.com/)'s [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) and [@craftzdog](https://github.com/craftzdog)'s [nvim config](https://github.com/craftzdog/dotfiles-public/tree/master/.config/nvim) for in my Neovim configs reference.
- [@catppuccin](https://github.com/catppuccin)'s colorscheme for the theming in my configs
