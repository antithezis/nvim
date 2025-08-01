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
      -- require("mini.ai").setup({ n_lines = 500 })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require("mini.surround").setup()

      require("mini.pairs").setup({
        modes = { insert = true, command = false, terminal = false },
        -- Global mappings. Each right hand side should be a pair information, a
        -- table with at least these fields (see more in |MiniPairs.map|):
        -- - <action> - one of 'open', 'close', 'closeopen'.
        -- - <pair> - two character string for pair to be used.
        -- By default pair is not inserted after `\`, quotes are not recognized by
        -- `<CR>`, `'` does not insert pair after a letter.
        -- Only parts of tables can be tweaked (others will use these defaults).
        mappings = {
          [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
          ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
          ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
          ["["] = {
            action = "open",
            pair = "[]",
            neigh_pattern = ".[%s%z%)}%]]",
            register = { cr = false },
            -- foo|bar -> press "[" -> foo[bar
            -- foobar| -> press "[" -> foobar[]
            -- |foobar -> press "[" -> [foobar
            -- | foobar -> press "[" -> [] foobar
            -- foobar | -> press "[" -> foobar []
            -- {|} -> press "[" -> {[]}
            -- (|) -> press "[" -> ([])
            -- [|] -> press "[" -> [[]]
          },
          ["{"] = {
            action = "open",
            pair = "{}",
            -- neigh_pattern = ".[%s%z%)}]",
            neigh_pattern = ".[%s%z%)}%]]",
            register = { cr = false },
            -- foo|bar -> press "{" -> foo{bar
            -- foobar| -> press "{" -> foobar{}
            -- |foobar -> press "{" -> {foobar
            -- | foobar -> press "{" -> {} foobar
            -- foobar | -> press "{" -> foobar {}
            -- (|) -> press "{" -> ({})
            -- {|} -> press "{" -> {{}}
          },
          ["("] = {
            action = "open",
            pair = "()",
            -- neigh_pattern = ".[%s%z]",
            neigh_pattern = ".[%s%z%)]",
            register = { cr = false },
            -- foo|bar -> press "(" -> foo(bar
            -- foobar| -> press "(" -> foobar()
            -- |foobar -> press "(" -> (foobar
            -- | foobar -> press "(" -> () foobar
            -- foobar | -> press "(" -> foobar ()
          },
          -- Single quote: Prevent pairing if either side is a letter
          ['"'] = {
            action = "closeopen",
            pair = '""',
            neigh_pattern = "[^%w\\][^%w]",
            register = { cr = false },
          },
          -- Single quote: Prevent pairing if either side is a letter
          ["'"] = {
            action = "closeopen",
            pair = "''",
            neigh_pattern = "[^%w\\][^%w]",
            register = { cr = false },
          },
          -- Backtick: Prevent pairing if either side is a letter
          ["`"] = {
            action = "closeopen",
            pair = "``",
            neigh_pattern = "[^%w\\][^%w]",
            register = { cr = false },
          },
        },
      })
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
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     cmdline = {
  --       enabled = true,
  --       view = "cmdline"
  --     },
  --     presets = {
  --       lsp_doc_border = false,
  --       bottom_search = false,
  --       command_palette = false,
  --     },
  --     lsp = {
  --       ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
  --       ["vim.lsp.util.stylize_markdown"] = false,
  --       ["cmp.entry.get_documentation"] = false,
  --     },
  --     hover = {
  --       enabled = false,
  --     },
  --     signature = {
  --       enabled = false,
  --       auto_open = {
  --         enabled = false
  --       }
  --     }
  --
  --   },
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
  },
  {
    "smjonas/live-command.nvim",
    config = function()
      require("live-command").setup({
        commands = {
          Norm = { cmd = "norm" },
        },
      })
    end,
  }

}
