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

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function ()
    vim.highlight.on_yank()
  end
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

