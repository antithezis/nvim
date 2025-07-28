local opts = { noremap = true, silent = true }

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("i", "jj", "<Esc>", opts)

vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")

-- Snacks keymaps converted to vim.keymap.set(...)

-- Top Pickers & Explorer
vim.keymap.set("n", "<leader><space>", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>n", function() Snacks.picker.notifications() end, { desc = "Notification History" })
vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })

-- find
vim.keymap.set("n", "<leader>o", function()
  Snacks.picker.buffers({
    win = {
      input = {
        keys = {
          ["dd"] = "bufdelete",
          ["<c-d>"] = { "bufdelete", mode = { "n", "i" } },
        },
      },
      list = { keys = { ["dd"] = "bufdelete" } },
    },
  })
end, { desc = "Buffers" })

vim.keymap.set("n", "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
  { desc = "Find Config File" })
vim.keymap.set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })
vim.keymap.set("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent" })

-- git
vim.keymap.set("n", "<leader>gb", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
vim.keymap.set("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = "Git Log" })
vim.keymap.set("n", "<leader>gL", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
vim.keymap.set("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
vim.keymap.set("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
vim.keymap.set("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })

-- Grep
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<C-s>", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
vim.keymap.set("n", "<leader>st", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set({ "n", "x" }, "<leader>sw", function() Snacks.picker.grep_word() end,
  { desc = "Visual selection or word" })

-- search
vim.keymap.set("n", "<leader>s\"", function() Snacks.picker.registers() end, { desc = "Registers" })
vim.keymap.set("n", "<leader>s/", function() Snacks.picker.search_history() end, { desc = "Search History" })
vim.keymap.set("n", "<leader>sa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
vim.keymap.set("n", "<leader>sb", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })
vim.keymap.set("n", "<leader>sc", function() Snacks.picker.command_history() end, { desc = "Command History" })
vim.keymap.set("n", "<leader>sC", function() Snacks.picker.commands() end, { desc = "Commands" })
vim.keymap.set("n", "<leader>sD", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>sd", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sH", function() Snacks.picker.highlights() end, { desc = "Highlights" })
vim.keymap.set("n", "<leader>si", function() Snacks.picker.icons() end, { desc = "Icons" })
vim.keymap.set("n", "<leader>sj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>sl", function() Snacks.picker.loclist() end, { desc = "Location List" })
vim.keymap.set("n", "<leader>sm", function() Snacks.picker.marks() end, { desc = "Marks" })
vim.keymap.set("n", "<leader>sM", function() Snacks.picker.man() end, { desc = "Man Pages" })
vim.keymap.set("n", "<leader>sp", function() Snacks.picker.lazy() end, { desc = "Search for Plugin Spec" })
vim.keymap.set("n", "<leader>sq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
vim.keymap.set("n", "<leader>sR", function() Snacks.picker.resume() end, { desc = "Resume" })
vim.keymap.set("n", "<leader>su", function() Snacks.picker.undo() end, { desc = "Undo History" })
vim.keymap.set("n", "<leader>uC", function() Snacks.picker.colorschemes() end, { desc = "Colorschemes" })

-- LSP
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
vim.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
vim.keymap.set("n", "<leader>p", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
vim.keymap.set("n", "<leader>WS", function() Snacks.picker.lsp_workspace_symbols() end,
  { desc = "LSP Workspace Symbols" })

-- Other
vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })
vim.keymap.set("n", "<leader>Z", function() Snacks.zen.zoom() end, { desc = "Toggle Zoom" })
vim.keymap.set("n", "<leader>.", function() Snacks.scratch() end, { desc = "Toggle Scratch Buffer" })
vim.keymap.set("n", "<leader>S", function() Snacks.scratch.select() end, { desc = "Select Scratch Buffer" })
vim.keymap.set("n", "<leader>n", function() Snacks.notifier.show_history() end, { desc = "Notification History" })
vim.keymap.set("n", "Q", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
vim.keymap.set("n", "<leader>cR", function() Snacks.rename.rename_file() end, { desc = "Rename File" })
vim.keymap.set({ "n", "v" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse" })
vim.keymap.set("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>un", function() Snacks.notifier.hide() end, { desc = "Dismiss All Notifications" })
vim.keymap.set("n", "<c-/>", function() Snacks.terminal() end, { desc = "Toggle Terminal" })
vim.keymap.set("n", "<c-_>", function() Snacks.terminal() end, { desc = "which_key_ignore" })
vim.keymap.set({ "n", "t" }, "]]", function() Snacks.words.jump(vim.v.count1) end, { desc = "Next Reference" })
vim.keymap.set({ "n", "t" }, "[[", function() Snacks.words.jump(-vim.v.count1) end, { desc = "Prev Reference" })
vim.keymap.set("n", "<leader>N", function()
  Snacks.win({
    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
    width = 0.6,
    height = 0.6,
    wo = {
      spell = false,
      wrap = false,
      signcolumn = "yes",
      statuscolumn = " ",
      conceallevel = 3,
    },
  })
end, { desc = "Neovim News" })

-- UFO
vim.keymap.set('n', 'zR', function() require('ufo').openAllFolds() end, { desc = 'UFO: Open all folds' })
vim.keymap.set('n', 'zM', function() require('ufo').closeAllFolds() end, { desc = 'UFO: Close all folds' })
vim.keymap.set('n', 'K', function()
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then vim.lsp.buf.hover() end
end, { desc = 'UFO: Peek fold or hover' })

-- which-key
vim.keymap.set('n', '<leader>?', function() require("which-key").show({ global = false }) end,
  { desc = "Buffer Local Keymaps (which-key)" })

-- Spectre
vim.keymap.set('n', '<leader>Rr', function() require("spectre").open() end, { desc = "Replace" })
vim.keymap.set('n', '<leader>Rw', function() require("spectre").open_visual({ select_word = true }) end,
  { desc = "Replace Word" })
vim.keymap.set('n', '<leader>Rf', function() require("spectre").open_file_search() end, { desc = "Replace Buffer" })

-- Flash
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function() require("flash").remote() end, { desc = "Remote Flash" })
vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, { desc = "Treesitter Search" })
vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end, { desc = "Toggle Flash Search" })

-- Showkeys
vim.keymap.set('n', '<leader>ut', function() vim.cmd("ShowkeysToggle") end, { desc = "Show key presses" })

-- Trouble
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' })
vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
  { desc = 'Buffer Diagnostics (Trouble)' })
vim.keymap.set('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Symbols (Trouble)' })
vim.keymap.set('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
  { desc = 'LSP Definitions / references / ... (Trouble)' })
vim.keymap.set('n', '<leader>xL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' })
vim.keymap.set('n', '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List (Trouble)' })

-- Mason
vim.keymap.set('n', '<leader>cm', '<cmd>Mason<cr>', { desc = 'Mason' })
