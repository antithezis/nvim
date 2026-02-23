-- Treesitter: Syntax highlighting and textobjects
return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "bash", "c", "css", "go", "gomod", "gowork", "gosum",
        "html", "javascript", "json", "lua", "luadoc", "luap",
        "markdown", "markdown_inline", "php", "proto",
        "python", "query", "regex", "rust", "terraform",
        "tsx", "typescript", "vim", "vimdoc", "vue", "yaml", "zig",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>vv",
          node_incremental = "+",
          scope_incremental = false,
          node_decremental = "_",
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)
    end,
  },

  -- Textobjects (separate plugin spec)
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      -- Textobjects keymaps using native vim way
      local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")
      
      -- Repeat movement with ; and ,
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
    end,
  },

  -- Treesitter context: Show context at top of screen
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      enable = true,
      max_lines = 4,
    },
  },
}
