-- ╭─────────────────────────────────────────────────────────╮
-- │                    NEOVIM CONFIG                        │
-- │              ~/.config/nvim/init.lua                    │
-- ╰─────────────────────────────────────────────────────────╯

-- Set leader keys before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Enable nerd font icons
vim.g.have_nerd_font = true

-- Load configuration
require("config")
