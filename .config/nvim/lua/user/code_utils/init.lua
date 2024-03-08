-----------------------------------------------------------------------
-- NeoVim config module for code supports utilities
-----------------------------------------------------------------------

require("user.code_utils.cmp")
require("user.code_utils.git")
require("user.code_utils.comment")
require("user.code_utils.auto_close_tag")
require("user.code_utils.autopairs")
require("user.code_utils.surround")
require("user.code_utils.renamer")
require("user.code_utils.snippets")
require("user.code_utils.treesitter_context")
require("user.code_utils.todos")
require("user.code_utils.zen_mode")
require("user.code_utils.twilight")
require("user.code_utils.colorizer")
require("user.code_utils.indent_blankline")
require("user.code_utils.markdown_preview")

-- Obsidian supports
require("user.code_utils.obsidian")

-- Latex supports
require("user.code_utils.vimtex")

-- Jupyter Notebook supports
require("user.code_utils.jupytext")
require("user.code_utils.iron")

-- Debugger supports
require("user.code_utils.dap")
