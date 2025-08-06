require("rose-pine").setup({
    variant = "auto",     -- auto, main, moon, dawn
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
