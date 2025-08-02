local M = {}

local function get_palette()
  return {
    bg       = "#191724",
    fg       = "#e0def4",
    yellow   = "#f6c177",
    cyan     = "#9ccfd8",
    darkblue = "#26233a",
    green    = "#31748f",
    orange   = "#f6c177",
    violet   = "#c4a7e7",
    magenta  = "#eb6f92",
    blue     = "#31748f",
    red      = "#eb6f92",
    pink     = "#ebbcba",
  }
end

function M.build_theme()
  return get_palette()
end

function M.apply_highlights()
  local c = get_palette()

  vim.api.nvim_set_hl(0, 'LualineNormalC', { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, 'LualineInactiveC', { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, 'LualineFilename', { fg = c.fg, bg = c.bg })

  vim.api.nvim_set_hl(0, 'LualineDiagnosticsError', { bg = c.bg, fg = c.red })
  vim.api.nvim_set_hl(0, 'LualineDiagnosticsWarn', { bg = c.bg, fg = c.yellow })
  vim.api.nvim_set_hl(0, 'LualineDiagnosticsInfo', { bg = c.bg, fg = c.cyan })
  vim.api.nvim_set_hl(0, 'LualineLsp', { bg = c.bg, fg = c.pink })
  vim.api.nvim_set_hl(
    0,
    'LualineBranch',
    { bg = c.bg, fg = c.violet, bold = true }
  )
  vim.api.nvim_set_hl(
    0,
    'LualineDiffAdded',
    { bg = c.bg, fg = c.green, bold = true }
  )
  vim.api.nvim_set_hl(
    0,
    'LualineDiffModified',
    { bg = c.bg, fg = c.orange, bold = true }
  )
  vim.api.nvim_set_hl(
    0,
    'LualineDiffRemoved',
    { bg = c.bg, fg = c.red, bold = true }
  )

  -- add more as needed
end

return M
