-- ╭─────────────────────────────────────────────────────────╮
-- │                    AUTOCOMMANDS                         │
-- │              lua/config/autocmds.lua                    │
-- ╰─────────────────────────────────────────────────────────╯

local function augroup(name)
  return vim.api.nvim_create_augroup("config_" .. name, { clear = true })
end

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "startuptime",
    "checkhealth",
    "spectre_panel",
    "neotest-output",
    "neotest-summary",
    "neotest-output-panel",
    "gitsigns.blame",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", {
      buffer = event.buf,
      silent = true,
      desc = "Quit buffer",
    })
  end,
})

-- Auto-hide search highlight
vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local new_hlsearch = vim.tbl_contains(
      { "<CR>", "n", "N", "*", "#", "?", "/" },
      vim.fn.keytrans(char)
    )
    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end, vim.api.nvim_create_namespace("auto_hlsearch"))

-- Resize splits on window resize
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup("resize_splits"),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- Go to last location when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function(event)
    local exclude = { "gitcommit" }
    local buf = event.buf
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
      return
    end
    vim.b[buf].lazyvim_last_loc = true
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Auto-start treesitter
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("treesitter"),
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

-- LSP keymaps on attach
vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup("lsp_attach"),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- LSP actions
    map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
    map("gs", vim.lsp.buf.signature_help, "Signature Help")
    map("<leader>la", vim.lsp.buf.code_action, "Code Action")
    map("<leader>la", vim.lsp.buf.code_action, "Code Action", "v")
    map("<leader>lr", vim.lsp.buf.rename, "Rename")
    map("<leader>lf", vim.lsp.buf.format, "Format")
    map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Definition in Vsplit")

    -- Workspace folders
    map("<leader>Wa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
    map("<leader>Wr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
    map("<leader>Wl", function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, "List Workspace Folders")

    -- Document highlight
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_augroup = vim.api.nvim_create_augroup("lsp_highlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })
      vim.api.nvim_create_autocmd("LspDetach", {
        group = vim.api.nvim_create_augroup("lsp_detach", { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({ group = "lsp_highlight", buffer = event2.buf })
        end,
      })
    end

    -- Inlay hints toggle
    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
      map("<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
      end, "Toggle Inlay Hints")
    end
  end,
})
