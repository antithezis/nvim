vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

require("core.lazy")
require("core.lsp")

require("config.options")
require("config.autocmds")
require("config.keymaps")

