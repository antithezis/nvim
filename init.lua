require "configs.options"
require "plugins.plugins"
require "plugins.configs"
require "configs.keymaps"
-- vim.cmd("set cnmpleteopt+=noselect")

require "vague".setup({ transparent = true })

vim.cmd("colorscheme vague")
vim.cmd(":hi statusline guibg=NONE")


