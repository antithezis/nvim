return {
  -- Autotags
  {
    "windwp/nvim-ts-autotag",
    event = "LspAttach",
    ft = { "javascript", "typescript" },
    opts = {},
  },

  -- comments
  {
    "numToStr/Comment.nvim",
    event = "LspAttach",
    opts = {},
  },
  -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
  { "joosepalviste/nvim-ts-context-commentstring", lazy = true },

  -- Neovim plugin to improve the default vim.ui interfaces
  {
    "stevearc/dressing.nvim",
    event = { "BufRead", "BufNewfile" },
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    config = function()
      require("dressing").setup()
    end,
  },

  -- Neovim notifications and LSP progress messages
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    config = function()
      require("fidget").setup()
    end
  },

  -- find and replace
  {
    "windwp/nvim-spectre",
    enabled = true,
    event = "BufRead",
  },

  -- Heuristically set buffer options
  {
    "tpope/vim-sleuth",
    event = { "BufRead", "BufReadPost" }
  },

  {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    -- {
    --   "saghen/blink.cmp",
    --   opts = {
    --     sources = {
    --       -- add lazydev to your completion providers
    --       default = { "lazydev", "lsp", "path", "snippets", "buffer" },
    --       providers = {
    --         lazydev = {
    --           name = "LazyDev",
    --           module = "lazydev.integrations.blink",
    --           -- make lazydev completions top priority (see `:h blink.cmp`)
    --           score_offset = 100,
    --         },
    --       },
    --     },
    --   },
    -- }
  },

  -- editor config support
  -- {
  --   "editorconfig/editorconfig-vim",
  -- },

  {
    "folke/flash.nvim",
    event = { 'BufReadPost', 'BufNewFile', 'CmdlineEnter' },
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
  },

  -- persist sessions
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {},
  },

  {
    "echasnovski/mini.nvim",
    event = "LspAttach",
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require("mini.ai").setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()

      require("mini.pairs").setup()

      -- local statusline = require("mini.statusline")
      -- statusline.setup({
      --   use_icons = vim.g.have_nerd_font,
      -- })
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return "%2l:%-2v"
      -- end
    end,
  },
  {
    "nvchad/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      timeout = 1,
      maxkeys = 6,
      -- bottom-left, bottom-right, bottom-center, top-left, top-right, top-center
      position = "bottom-right",
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline"
      },
      presets = {
        bottom_search = true,
        command_palette = false,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
  }

}
