require "snacks".setup({
        bigfile = { enabled = true },
        explorer = { enabled = true },
        indent = { enabled = false },
        input = { enabled = true },
        notifier = {
                enabled = true,
                timeout = 3000,
        },
        picker = {
                enabled = true,
                sources = {
                        files = { hidden = true },
                },
        },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = {
                notification = {
                        -- wo = { wrap = true } -- Wrap notifications
                },
        },
})
