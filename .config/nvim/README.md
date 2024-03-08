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

* Plugins management via [vim-plug](https://github.com/junegunn/vim-plug)
* Auto install plugins
* Keymaps: Supports a set of custom keymaps, as well as some standard keymaps inspired from `vim` and other editors
* General code supports:
  - Syntax parser and highlighter via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  - LSP support via [lspconfig](https://github.com/neovim/nvim-lspconfig) and [mason](https://github.com/williamboman/mason.nvim)
  - Code formatter via [efm-lang-server](https://github.com/mattn/efm-langserver)
  - Git supports
  - Context sticky scrolling
  - ...
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
    + 1 light flavor: light
  - [Github theme](https://github.com/projekt0n/github-nvim-theme)
    + 5 dark flavours: dark, dark dimmed, dark high contrast, dark colorblind, dark tritanopia
    + 4 light flavors: light, light high contrast, light colorblind, light tritanopia
  - All of them support [transparency](https://github.com/xiyaowong/transparent.nvim), which I use in conjunction with my terminal setups.
* Others:
  - Discipline for good practice in `vim` via [hardtime](https://github.com/m4xshen/hardtime.nvim)
  - Configs for [Neovide](https://neovide.dev/)
  - Configs for [IdeaVim](https://github.com/JetBrains/ideavim)

## Plugins management

Though I have prepared a snippet for setting up `Lazy.nvim`, I'm currently have no motivation to migrate from `Plug`.
`Lazy` is said to boost the startup time and have better dependency management between plugins, but for me adding or removing plugins in the `Plug` way feels easier.

My config auto installs the plugin manager and missing plugins by default now. Through the code in charge of this is currently written in Vimscript, it works fine so I might consider migrate to Lua if I got time.

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

## Thanks-to

- [LunarVim's](https://www.lunarvim.org/) [Neovim-from-scratch](https://github.com/LunarVim/Neovim-from-scratch) template for my config structure.
