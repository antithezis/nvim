vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>o', ":Pick buffers<CR>")
vim.keymap.set('n', '<leader>/', ":Pick grep_live<CR>")
vim.keymap.set('n', '<leader>f', ":Pick files<CR>")
vim.keymap.set('n', '<leader>h', ":Pick help<CR>")

vim.keymap.set('n', '<leader>j', "<cmd>cnext<CR>zz")
vim.keymap.set('n', '<leader>k', "<cmd>cprev<CR>zz")
vim.keymap.set('n', '<leader>l', "<cmd>lnext<CR>zz")
vim.keymap.set('n', '<leader>;', "<cmd>lprev<CR>zz")

vim.keymap.set('n', '<leader>e', ":Oil<CR>")

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("i", "jj", "<Esc>", opts)

vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")
