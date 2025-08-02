vim.pack.add({
    --Treesitter
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },

    -- LSPs
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = "https://github.com/neovim/nvim-lspconfig" },

    -- CMPs
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/saghen/blink.cmp", version = "v1.6.0"}, -- Or 'vim.version.range('1.6.0')'

    -- Ufo
    { src = "https://github.com/kevinhwang91/nvim-ufo" },
    { src = "https://github.com/kevinhwang91/promise-async" },
    { src = "https://github.com/luukvbaal/statuscol.nvim" },

    -- UI
    { src = "https://github.com/j-hui/fidget.nvim" },
    { src = "https://github.com/stevearc/dressing.nvim" },
    { src = "https://github.com/MunifTanjim/nui.nvim" },
    { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/folke/which-key.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },

    -- Utils
    { src = "https://github.com/folke/snacks.nvim" },
    { src = "https://github.com/echasnovski/mini.nvim" },

    -- Themes
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
})

require "plugins.float-terminal"
require "plugins.marks"
