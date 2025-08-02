-- Snacks keymaps converted to vim.keymap.set(...)
-- (Nota: tienes <leader>n definido dos veces. El último ganará. Elimínalo si no quieres sobrescribir.)

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("i", "jj", "<Esc>", opts)

vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")

