vim.pack.add({
  { src = "https://github.com/vague2k/vague.nvim" },
  { src = "https://github.com/stevearc/oil.nvim" },
  { src = "https://github.com/echasnovski/mini.nvim" },
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/saghen/blink.cmp",          version = "v1.6.0" }, -- Or 'vim.version.range('1.6.0')'
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
  -- { src = "https://github.com/github/copilot.vim" },
  -- { src = "https://github.com/stevearc/dressing.nvim" },
  -- { src = "https://github.com/j-hui/fidget.nvim" },
  { src = "https://github.com/kevinhwang91/nvim-ufo" },
  { src = "https://github.com/kevinhwang91/promise-async" },
  { src = "https://github.com/luukvbaal/statuscol.nvim" },
})

require "configs"
require "options"
require "autocmds"
require "keymaps"

vim.cmd("set completeopt+=noselect")

vim.lsp.enable({ "lua_ls", "ts_ls" })

require "vague".setup({ transparent = true })
vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")
