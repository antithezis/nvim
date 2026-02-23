-- LSP + Mason configuration

-- Enable LSP servers (Neovim 0.11+ native config from lsp/ directory)
vim.lsp.enable({
  "lua-ls",
  "ts-ls",
  -- "angular-ls",  -- Uncomment when needed
  -- "csharp-ls",   -- Uncomment when needed
})

return {
  -- Mason: Package manager for LSP servers, formatters, linters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      ensure_installed = {
        -- LSP servers
        "lua-language-server",
        "typescript-language-server",
        "rust-analyzer",
        "tailwindcss-language-server",
        "html-lsp",
        "css-lsp",
        "vue-language-server",
        -- Formatters
        "stylua",
        "prettier",
        "black",
        "isort",
        -- Linters
        "golangci-lint",
        "eslint_d",
        "luacheck",
        "shfmt",
        "shellcheck",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)

      -- Auto-install ensure_installed tools
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          if mr.has_package(tool) then
            local p = mr.get_package(tool)
            if not p:is_installed() then
              p:install()
            end
          end
        end
      end

      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },

  -- Lazydev: Lua development for Neovim
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  -- Fidget: LSP progress notifications (configured in ui.lua)
}
