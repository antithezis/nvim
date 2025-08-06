vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.swapfile = false
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/saghen/blink.cmp",       version = "v1.6.0" }, -- Or 'vim.version.range('1.6.0')'
  { src = "https://github.com/github/copilot.vim" },
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  { src = "https://github.com/stevearc/dressing.nvim" },
})

require "mason".setup()
require "oil".setup()

require "mini.pick".setup()
require "mini.icons".setup()
require "mini.surround".setup()
require "blink-cmp".setup({
  keymap = { preset = 'default' },
  appearance = { use_nvim_cmp_as_default = false },
  signature = { enabled = true }
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "oil",
    "qf"
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", {
      buffer = event.buf,
      silent = true,
      desc = "Quit buf"
    })
  end
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-atach", { clear = true }),
  callback = function()
    -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    -- vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
    -- vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>p', vim.lsp.buf.workspace_symbol)
    vim.keymap.set('n', '[d', function()
      vim.diagnostic.jump({ count = 1, float = true })
    end)
    vim.keymap.set('n', ']d', function()
      vim.diagnostic.jump({ count = -1, float = true })
    end)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references)
    vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename)
  end,
})


vim.cmd("set completeopt+=noselect")

vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>o', ":Pick buffers<CR>")
vim.keymap.set('n', '<leader>/', ":Pick grep_live<CR>")
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")

vim.keymap.set('n', '<leader>e', ":Oil<CR>")

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.lsp.enable({ "lua_ls", "ts_ls" })

require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
