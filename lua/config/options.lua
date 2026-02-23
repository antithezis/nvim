-- ╭─────────────────────────────────────────────────────────╮
-- │                    EDITOR OPTIONS                       │
-- │              lua/config/options.lua                     │
-- ╰─────────────────────────────────────────────────────────╯

local opt = vim.opt

-- Line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true
opt.breakindent = true

-- Display
opt.wrap = true
opt.showmode = false
opt.cursorline = false
opt.signcolumn = "yes"
opt.termguicolors = true
opt.laststatus = 3 -- Global statusline
opt.winborder = "rounded"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.inccommand = "split"

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Mouse and clipboard
opt.mouse = "a"
vim.schedule(function()
  opt.clipboard = "unnamedplus"
end)

-- Undo and swap
opt.undofile = true
opt.swapfile = false

-- Performance
opt.updatetime = 250
opt.timeoutlen = 300

-- Whitespace characters
opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Scrolling
opt.scrolloff = 10
opt.sidescrolloff = 8

-- Fill characters
opt.fillchars = {
  eob = " ",
  fold = " ",
  foldsep = " ",
}

-- Folding (using UFO)
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true
