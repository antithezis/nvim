local opts = {
    ensure_installed = {
        -- LSPs
        "lua-language-server",
        "typescript-language-server",
        "angular-language-server",

        --Formatters
        "stylua",
        "prettier",

        -- Linters and diagnostics
        "eslint_d",
        "luacheck", -- Lua linting

    }
}

require('mason').setup(opts)
-- require('mason-lspconfig').setup()

local mr = require("mason-registry")

local function ensure_installed()
    for _, tool in ipairs(opts.ensure_installed) do
        if mr.has_package(tool) then
            local p = mr.get_package(tool)
            if not p:is_installed() then
                vim.notify("Mason: Installing " .. tool .. "...", vim.log.levels.INFO)
                p:install():once("closed", function()
                    if p:is_installed() then
                        vim.notify("Mason: Successfully installed " .. tool, vim.log.levels.INFO)
                    else
                        vim.notify("Mason: Failed to install " .. tool, vim.log.levels.ERROR)
                    end
                end)
            end
        else
            vim.notify("Mason: Package '" .. tool .. "' not found", vim.log.levels.WARN)
        end
    end
end

if mr.refresh then
    mr.refresh(ensure_installed)
else
    ensure_installed()
end

-- local capabilities = require "blink.cmp".get_lsp_capabilities()
-- require "lspconfig".lua_ls.setup{}

require "core.lsp"
