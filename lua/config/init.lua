-- ╭─────────────────────────────────────────────────────────╮
-- │                    CONFIG LOADER                        │
-- │            lua/config/init.lua                          │
-- ╰─────────────────────────────────────────────────────────╯

-- Load configuration in order
require("config.options")  -- Editor options first
require("config.lazy")     -- Plugin manager and plugins
require("config.keymaps")  -- Keymaps after plugins
require("config.autocmds") -- Autocommands last
