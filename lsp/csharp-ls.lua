-- csharp-language-server configuration
-- https://github.com/razzmatazz/csharp-language-server

-- Helper function to find root pattern
local function root_pattern(...)
  local patterns = { ... }
  return function(startpath)
    for _, pattern in ipairs(patterns) do
      local match = vim.fs.find(pattern, {
        path = startpath,
        upward = true,
        type = "file",
      })[1]
      if match then
        return vim.fs.dirname(match)
      end
    end
    return nil
  end
end

return {
  cmd = function(dispatchers, config)
    return vim.lsp.rpc.start({ "csharp-ls" }, dispatchers, {
      cwd = config.cmd_cwd or config.root_dir,
      env = config.cmd_env,
      detached = config.detached,
    })
  end,
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local root = root_pattern("*.sln")(fname)
      or root_pattern("*.slnx")(fname)
      or root_pattern("*.csproj")(fname)
    on_dir(root)
  end,
  filetypes = { "cs" },
  init_options = {
    AutomaticWorkspaceInit = true,
  },
}
