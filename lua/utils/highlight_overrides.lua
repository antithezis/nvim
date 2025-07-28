-- highlight_overrides.lua
-- Función para obtener overrides comunes entre temas

local M = {}

--- Recibe una tabla de colores y devuelve los overrides comunes
function M.common(colors)
  return {
    -- Completion menu styling
    Pmenu = { bg = colors.mantle or colors.base, fg = colors.text },
    PmenuSel = { bg = colors.surface0 or colors.surface, fg = colors.text },
    PmenuSbar = { bg = colors.surface0 or colors.surface },
    PmenuThumb = { bg = colors.surface2 or colors.muted },
    PmenuExtra = { bg = colors.mantle or colors.base, fg = colors.subtext1 or colors.subtle },

    -- Floating windows
    NormalFloat = { bg = colors.mantle or colors.base },
    FloatBorder = { bg = colors.mantle or colors.base, fg = colors.surface2 or colors.muted },
    FloatTitle = { bg = colors.mantle or colors.base, fg = colors.text },

    -- Blink.cmp specific highlighting
    BlinkCmpMenu = { bg = colors.mantle or colors.base, fg = colors.text },
    BlinkCmpMenuBorder = { bg = colors.mantle or colors.base, fg = colors.surface2 or colors.muted },
    BlinkCmpMenuSelection = { bg = colors.surface0 or colors.surface, fg = colors.text },
    BlinkCmpScrollBarThumb = { bg = colors.surface2 or colors.muted },
    BlinkCmpScrollBarGutter = { bg = colors.surface0 or colors.surface },
    BlinkCmpLabel = { bg = colors.mantle or colors.base, fg = colors.text },
    BlinkCmpLabelDeprecated = { bg = colors.mantle or colors.base, fg = colors.overlay0 or colors.muted, strikethrough = true },
    BlinkCmpLabelDetail = { bg = colors.mantle or colors.base, fg = colors.subtext1 or colors.subtle },
    BlinkCmpLabelDescription = { bg = colors.mantle or colors.base, fg = colors.subtext1 or colors.subtle },
    BlinkCmpKind = { bg = colors.mantle or colors.base, fg = colors.peach or colors.rose },
    BlinkCmpSource = { bg = colors.mantle or colors.base, fg = colors.overlay1 or colors.subtle },
    BlinkCmpGhostText = { fg = colors.overlay0 or colors.muted, italic = true },
    BlinkCmpDoc = { bg = colors.mantle or colors.base, fg = colors.text },
    BlinkCmpDocBorder = { bg = colors.mantle or colors.base, fg = colors.surface2 or colors.muted },
    BlinkCmpDocSeparator = { bg = colors.mantle or colors.base, fg = colors.surface1 or colors.surface },
    BlinkCmpDocCursorLine = { bg = colors.surface0 or colors.surface },
    BlinkCmpSignatureHelp = { bg = colors.mantle or colors.base, fg = colors.text },
    BlinkCmpSignatureHelpBorder = { bg = colors.mantle or colors.base, fg = colors.surface2 or colors.muted },
    BlinkCmpSignatureHelpActiveParameter = { bg = colors.surface0 or colors.surface, fg = colors.peach or colors.rose, bold = true },

    -- Snacks.nvim picker NvChad style
    SnacksPicker = { bg = colors.base },
    SnacksPickerBorder = { fg = colors.surface0 or colors.surface, bg = colors.base },
    SnacksPickerPreview = { bg = colors.base },
    SnacksPickerPreviewBorder = { fg = colors.base, bg = colors.base },
    SnacksPickerPreviewTitle = { fg = colors.base, bg = colors.green or colors.foam },
    SnacksPickerBoxBorder = { fg = colors.base, bg = colors.base },
    SnacksPickerInputBorder = { fg = colors.surface2 or colors.muted, bg = colors.base },
    SnacksPickerInputSearch = { fg = colors.text, bg = colors.base },
    SnacksPickerList = { bg = colors.base },
    SnacksPickerListBorder = { fg = colors.base, bg = colors.base },
    SnacksPickerListTitle = { fg = colors.base, bg = colors.base },
    SnacksPickerDir = { fg = colors.blue or colors.foam },
    SnacksPickerFile = { fg = colors.text },
    SnacksPickerMatch = { fg = colors.peach or colors.rose, bold = true },
    SnacksPickerCursor = { bg = colors.surface0 or colors.surface, fg = colors.text },
    SnacksPickerSelected = { bg = colors.surface0 or colors.surface, fg = colors.text },
    SnacksPickerIcon = { fg = colors.blue or colors.foam },
    SnacksPickerSource = { fg = colors.overlay1 or colors.subtle },
    SnacksPickerCount = { fg = colors.overlay1 or colors.subtle },
    SnacksPickerFooter = { fg = colors.overlay1 or colors.subtle },
    SnacksPickerHeader = { fg = colors.text, bold = true },
    SnacksPickerSpecial = { fg = colors.peach or colors.rose },
    SnacksPickerIndent = { fg = colors.surface1 or colors.surface },
    SnacksPickerMulti = { fg = colors.peach or colors.rose },
    SnacksPickerTitle = { fg = colors.text, bold = true },
    SnacksPickerPrompt = { fg = colors.text },

    -- Snacks core components
    SnacksNotifierNormal = { bg = colors.mantle or colors.base, fg = colors.text },
    SnacksNotifierBorder = { bg = colors.mantle or colors.base, fg = colors.surface2 or colors.muted },
    SnacksNotifierTitle = { bg = colors.mantle or colors.base, fg = colors.text, bold = true },
    SnacksNotifierIcon = { bg = colors.mantle or colors.base, fg = colors.blue or colors.foam },
    SnacksNotifierIconInfo = { bg = colors.mantle or colors.base, fg = colors.blue or colors.foam },
    SnacksNotifierIconWarn = { bg = colors.mantle or colors.base, fg = colors.yellow or colors.gold },
    SnacksNotifierIconError = { bg = colors.mantle or colors.base, fg = colors.red or colors.love },

    -- Snacks Dashboard
    SnacksDashboardNormal = { bg = colors.base, fg = colors.text },
    SnacksDashboardDesc = { bg = colors.base, fg = colors.subtext1 or colors.subtle },
    SnacksDashboardFile = { bg = colors.base, fg = colors.text },
    SnacksDashboardDir = { bg = colors.base, fg = colors.blue or colors.foam },
    SnacksDashboardFooter = { bg = colors.base, fg = colors.overlay1 or colors.subtle },
    SnacksDashboardHeader = { bg = colors.base, fg = colors.text, bold = true },
    SnacksDashboardIcon = { bg = colors.base, fg = colors.blue or colors.foam },
    SnacksDashboardKey = { bg = colors.base, fg = colors.peach or colors.rose },
    SnacksDashboardTerminal = { bg = colors.base, fg = colors.text },
    SnacksDashboardSpecial = { bg = colors.base, fg = colors.peach or colors.rose },

    -- Snacks Terminal
    SnacksTerminalNormal = { bg = colors.mantle or colors.base, fg = colors.text },
    SnacksTerminalTitle = { bg = colors.mantle or colors.base, fg = colors.text, bold = true },

    -- Misc UI
    CmpItemMenu = { fg = colors.surface2 or colors.muted },
    CursorLineNr = { fg = colors.text },
    GitSignsChange = { fg = colors.peach or colors.rose },
    LineNr = { fg = colors.overlay0 or colors.subtle },
    VertSplit = { bg = colors.base, fg = colors.surface0 or colors.surface },
    YankHighlight = { bg = colors.surface2 or colors.muted },
    FidgetTask = { fg = colors.subtext1 or colors.subtle },
    FidgetTitle = { fg = colors.peach or colors.rose },
  }
end

return M
