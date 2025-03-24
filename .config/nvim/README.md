# My Neovim setup

A guideline about my Neovim setup

<!--toc:start-->
- [My Neovim setup](#my-neovim-setup)
  - [Structure](#structure)
  - [Features](#features)
  - [Supported languages:](#supported-languages)
  - [Code styles](#code-styles)
  - [Thanks-to](#thanks-to)
<!--toc:end-->

## Structure

TBA

## Features

* Plugins management via [Lazy.nvim](https://github.com/folke/lazy.nvim)
* Auto install plugins
* Keymaps: Supports a set of custom keymaps, as well as some standard keymaps inspired from `vim` and other editors
* General code supports:
  - Syntax parser and highlighter via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - LSP support via [lspconfig](https://github.com/neovim/nvim-lspconfig) and [mason](https://github.com/williamboman/mason.nvim)
  - Code formatter via [efm-lang-server](https://github.com/mattn/efm-langserver)
  - Git supports
  - Context sticky scrolling
  - ...
* Git integration:
  - Git commands integration via [fugitive](https://github.com/tpope/vim-fugitive)
  - Git signs via [gitsigns](https://github.com/lewis6991/gitsigns.nvim)
  - Diffview via [diffview](https://github.com/sindrets/diffview.nvim)
* Note-taking supports:
  - Obsidian integration
  - Markdown preview
* Jupyter Notebook supports for data science:
  - Convert `ipynb` files to `python` buffers and vice-versa on saving
  - Inreactive shell - TBA
* UI utilities:
  - Telescope
  - Bufferline
  - Lualine
  - Nvimtree
  - ...
* Colorschemes:
  - [Cappuccin](https://github.com/catppuccin/nvim) 
    + 3 dark flavours: mocha, frappe, macchiato
    + 1 light flavours: latte
  - [Nightfox](https://github.com/EdenEast/nightfox.nvim) 
    + 4 dark flavours: nightfox, duskfox, nordfox, terafox
    + 2 light flavours: dayfox, dawnfox
  - [Kanagawa](https://github.com/rebelot/kanagawa.nvim)
    + 2 dark flavours: dragon, wave
    + 1 light flavour: lotus
  - [Tokyonight](https://github.com/folke/tokyonight.nvim)
    + 3 dark flavours: night, moon, storm
    + 1 light flavour: day
  - [Everforest](https://github.com/neanias/everforest-nvim)
    + 3 contrast levels: soft, medium, hard
  - [Onedark](https://github.com/navarasu/onedark.nvim)
    + 6 dark flavors: dark, darker, cool, deep, warm, warmer
    + 1 light flavour: light
  - [Github theme](https://github.com/projekt0n/github-nvim-theme)
    + 5 dark flavours: dark, dark dimmed, dark high contrast, dark colorblind, dark tritanopia
    + 4 light flavors: light, light high contrast, light colorblind, light tritanopia
  - [Rose-pine](https://github.com/rose-pine/neovim)
    + 2 dark flavours: main, moon
    + 1 light flavour: dawn
  - All of them support [transparency](https://github.com/xiyaowong/transparent.nvim), which I use in conjunction with my terminal setups.
* Others:
  - Discipline for good practice in `vim` via [hardtime](https://github.com/m4xshen/hardtime.nvim)
  - Configs for [Neovide](https://neovide.dev/)
  - Configs for [IdeaVim](https://github.com/JetBrains/ideavim)

## Plugins management

`Lazy` is used as the plugin manager. The overall performace gets a noticable boost (especially on Windows).

## Supported languages:

Supported languages by default:
  - Python
  - Javascript
  - Typescript
  - Lua
  - Dart (+ Flutter) via [flutter-tools](https://github.com/akinsho/flutter-tools.nvim)
  - HTML
  - CSS
  - Json
  - Yaml
  - Docker
  - Bash
  - SQL
  - Markdown
  - LaTeX

Other languages can be supported by installing their correspond language server, the configuration will be automatically done.
Formatters and linters requires manual configurations.

## Code styles

- Tabwidth... - TBA

## Todo

- [ ] Update Dap and Dap UI
- [ ] Adopt `none-ls`

## Thanks-to

- [LunarVim's](https://www.lunarvim.org/) [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) - template for my config structure.
- [TJ's](https://github.com/tjdevries) [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) - some config references.
- [Josean Martinezs'](https://github.com/josean-dev) [config](https://github.com/josean-dev/dev-environment-files) - some config references.
