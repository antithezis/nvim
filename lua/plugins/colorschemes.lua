local highlight_overrides = require("utils.highlight_overrides")

return {
  --   {
  --     "catppuccin/nvim",
  --     priority = 150,
  --     name = "catppuccin",
  --     config = function()
  --       require("catppuccin").setup({
  --         background = {
  --           light = "latte",
  --           dark = "mocha",
  --         },
  --         color_overrides = {
  --           latte = {
  --             rosewater = "#c14a4a",
  --             flamingo = "#c14a4a",
  --             red = "#c14a4a",
  --             maroon = "#c14a4a",
  --             pink = "#945e80",
  --             mauve = "#945e80",
  --             peach = "#c35e0a",
  --             yellow = "#b47109",
  --             green = "#6c782e",
  --             teal = "#4c7a5d",
  --             sky = "#4c7a5d",
  --             sapphire = "#4c7a5d",
  --             blue = "#45707a",
  --             lavender = "#45707a",
  --             text = "#654735",
  --             subtext1 = "#73503c",
  --             subtext0 = "#805942",
  --             overlay2 = "#8c6249",
  --             overlay1 = "#8c856d",
  --             overlay0 = "#a69d81",
  --             surface2 = "#bfb695",
  --             surface1 = "#d1c7a3",
  --             surface0 = "#e3dec3",
  --             base = "#f9f5d7",
  --             mantle = "#f0ebce",
  --             crust = "#e8e3c8",
  --           },
  --           mocha = {
  --             rosewater = "#ea6962",
  --             flamingo = "#ea6962",
  --             red = "#ea6962",
  --             maroon = "#ea6962",
  --             pink = "#d3869b",
  --             mauve = "#d3869b",
  --             peach = "#e78a4e",
  --             yellow = "#d8a657",
  --             green = "#a9b665",
  --             teal = "#89b482",
  --             sky = "#89b482",
  --             sapphire = "#89b482",
  --             blue = "#7daea3",
  --             lavender = "#7daea3",
  --             text = "#ebdbb2",
  --             subtext1 = "#d5c4a1",
  --             subtext0 = "#bdae93",
  --             overlay2 = "#a89984",
  --             overlay1 = "#928374",
  --             overlay0 = "#595959",
  --             surface2 = "#4d4d4d",
  --             surface1 = "#343240",
  --             surface0 = "#292929",
  --             base = "#1e1e2e",
  --             mantle = "#191724",
  --             crust = "#141617",
  --           },
  --         },
  --         transparent_background = false,
  --         show_end_of_buffer = false,
  --         integration_default = false,
  --         no_bold = true,
  --         no_italic = true,
  --         no_underline = true,
  --         integrations = {
  --           blink_cmp = {
  --             style = 'bordered',
  --           },
  --           snacks = {
  --             enabled = true,
  --             -- indent_scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
  --           },
  --           -- barbecue = { dim_dirname = true, bold_basename = true, dim_context = false, alt_background = false },
  --           -- cmp = true,
  --           gitsigns = true,
  --           -- hop = true,
  --           -- illuminate = { enabled = true },
  --           native_lsp = { enabled = true, inlay_hints = { background = true } },
  --           -- neogit = true,
  --           -- neotree = true,
  --           semantic_tokens = true,
  --           treesitter = true,
  --           treesitter_context = true,
  --           -- vimwiki = true,
  --           which_key = true,
  --           -- aerial = true,
  --           fidget = true,
  --           mason = true,
  --           neotest = true,
  --           dap_ui = true,
  --           -- telescope = {
  --           --   enabled = true,
  --           --   style = "nvchad",
  --           -- },
  --         },
  --         highlight_overrides = {
  --   all = function(colors)
  --     return highlight_overrides.common(colors)
  --   end,
  --   latte = function(colors)
  --     return {
  --       IblIndent = { fg = colors.mantle },
  --       IblScope = { fg = colors.surface1 },
  --       LineNr = { fg = colors.surface1 },
  --     }
  --   end,
  --
  --   },
  -- lua/plugins/rose-pine.lua
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "auto", -- auto, main, moon, dawn
        dark_variant = "main",
        dim_inactive_windows = false,
        extend_background_behind_borders = true,
        enable = {
          terminal = true,
          legacy_highlights = true,
          migrations = true,
        },
        styles = {
          bold = true,
          italic = false,
          transparency = false,
        },
        groups = {
          border = "muted",
          panel = "surface",
          link = "iris",
          error = "love",
          hint = "iris",
          info = "foam",
          warn = "gold",
          git_add = "foam",
          git_change = "rose",
          git_delete = "love",
          h1 = "iris",
          h2 = "foam",
          h3 = "rose",
          h4 = "gold",
          h5 = "pine",
          h6 = "foam",
        },

        highlight_groups = (function()
          local highlight_overrides = require("utils.highlight_overrides")
          local vim = vim
          return vim.tbl_deep_extend("force",
            highlight_overrides.common {
              base = "base", text = "text", surface = "surface", muted = "muted", subtle = "subtle", rose = "rose", foam = "foam", gold = "gold", love = "love"
            },
            {
              -- Aquí puedes agregar overrides específicos de rose-pine si lo necesitas
              SnacksPickerPreviewTitle = { fg = "none", bg = "#31748f" },
              -- SnacksDashboardDir = { bg = "red", fg = "text" },
            }
          )
        end)(),
      })

      vim.cmd("colorscheme rose-pine")
    end
  }

}
