-- Colorscheme: rose-pine
return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        variant = "auto",
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
        highlight_groups = {
          -- Completion menu
          Pmenu = { bg = "base", fg = "text" },
          PmenuSel = { bg = "surface", fg = "text" },
          PmenuSbar = { bg = "surface" },
          PmenuThumb = { bg = "muted" },
          PmenuExtra = { bg = "base", fg = "subtle" },

          -- Floating windows
          NormalFloat = { bg = "base" },
          FloatBorder = { bg = "base", fg = "muted" },
          FloatTitle = { bg = "base", fg = "text" },

          -- Blink.cmp
          BlinkCmpMenu = { bg = "base", fg = "text" },
          BlinkCmpMenuBorder = { bg = "base", fg = "muted" },
          BlinkCmpMenuSelection = { bg = "surface", fg = "text" },
          BlinkCmpScrollBarThumb = { bg = "muted" },
          BlinkCmpScrollBarGutter = { bg = "surface" },
          BlinkCmpLabel = { bg = "base", fg = "text" },
          BlinkCmpLabelDeprecated = { bg = "base", fg = "muted", strikethrough = true },
          BlinkCmpLabelDetail = { bg = "base", fg = "subtle" },
          BlinkCmpLabelDescription = { bg = "base", fg = "subtle" },
          BlinkCmpKind = { bg = "base", fg = "rose" },
          BlinkCmpSource = { bg = "base", fg = "subtle" },
          BlinkCmpGhostText = { fg = "muted", italic = true },
          BlinkCmpDoc = { bg = "base", fg = "text" },
          BlinkCmpDocBorder = { bg = "base", fg = "muted" },
          BlinkCmpDocSeparator = { bg = "base", fg = "surface" },
          BlinkCmpDocCursorLine = { bg = "surface" },
          BlinkCmpSignatureHelp = { bg = "base", fg = "text" },
          BlinkCmpSignatureHelpBorder = { bg = "base", fg = "muted" },
          BlinkCmpSignatureHelpActiveParameter = { bg = "surface", fg = "rose", bold = true },

          -- Snacks picker
          SnacksPicker = { bg = "base" },
          SnacksPickerBorder = { fg = "surface", bg = "base" },
          SnacksPickerPreview = { bg = "base" },
          SnacksPickerPreviewBorder = { fg = "base", bg = "base" },
          SnacksPickerPreviewTitle = { fg = "base", bg = "foam" },
          SnacksPickerBoxBorder = { fg = "base", bg = "base" },
          SnacksPickerInputBorder = { fg = "muted", bg = "base" },
          SnacksPickerInputSearch = { fg = "text", bg = "base" },
          SnacksPickerList = { bg = "base" },
          SnacksPickerListBorder = { fg = "base", bg = "base" },
          SnacksPickerListTitle = { fg = "base", bg = "base" },
          SnacksPickerDir = { fg = "foam" },
          SnacksPickerFile = { fg = "text" },
          SnacksPickerMatch = { fg = "rose", bold = true },
          SnacksPickerCursor = { bg = "surface", fg = "text" },
          SnacksPickerSelected = { bg = "surface", fg = "text" },
          SnacksPickerIcon = { fg = "foam" },
          SnacksPickerSource = { fg = "subtle" },
          SnacksPickerCount = { fg = "subtle" },
          SnacksPickerFooter = { fg = "subtle" },
          SnacksPickerHeader = { fg = "text", bold = true },
          SnacksPickerSpecial = { fg = "rose" },
          SnacksPickerIndent = { fg = "surface" },
          SnacksPickerMulti = { fg = "rose" },
          SnacksPickerTitle = { fg = "text", bold = true },
          SnacksPickerPrompt = { fg = "text" },

          -- Snacks notifications
          SnacksNotifierNormal = { bg = "base", fg = "text" },
          SnacksNotifierBorder = { bg = "base", fg = "muted" },
          SnacksNotifierTitle = { bg = "base", fg = "text", bold = true },
          SnacksNotifierIcon = { bg = "base", fg = "foam" },
          SnacksNotifierIconInfo = { bg = "base", fg = "foam" },
          SnacksNotifierIconWarn = { bg = "base", fg = "gold" },
          SnacksNotifierIconError = { bg = "base", fg = "love" },

          -- Snacks dashboard
          SnacksDashboardNormal = { bg = "base", fg = "text" },
          SnacksDashboardDesc = { bg = "base", fg = "subtle" },
          SnacksDashboardFile = { bg = "base", fg = "text" },
          SnacksDashboardDir = { bg = "base", fg = "foam" },
          SnacksDashboardFooter = { bg = "base", fg = "subtle" },
          SnacksDashboardHeader = { bg = "base", fg = "text", bold = true },
          SnacksDashboardIcon = { bg = "base", fg = "foam" },
          SnacksDashboardKey = { bg = "base", fg = "rose" },
          SnacksDashboardTerminal = { bg = "base", fg = "text" },
          SnacksDashboardSpecial = { bg = "base", fg = "rose" },

          -- Snacks terminal
          SnacksTerminalNormal = { bg = "base", fg = "text" },
          SnacksTerminalTitle = { bg = "base", fg = "text", bold = true },

          -- Misc UI
          CmpItemMenu = { fg = "muted" },
          CursorLineNr = { fg = "text" },
          GitSignsChange = { fg = "rose" },
          LineNr = { fg = "subtle" },
          VertSplit = { bg = "base", fg = "surface" },
          YankHighlight = { bg = "muted" },
          FidgetTask = { fg = "subtle" },
          FidgetTitle = { fg = "rose" },
        },
      })

      vim.cmd.colorscheme("rose-pine")
    end,
  },
}
