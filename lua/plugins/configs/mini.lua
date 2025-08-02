require "mini.surround".setup()
require "mini.pairs".setup({
        modes = { insert = true, command = false, terminal = false },
        -- Global mappings. Each right hand side should be a pair information, a
        -- table with at least these fields (see more in |MiniPairs.map|):
        -- - <action> - one of 'open', 'close', 'closeopen'.
        -- - <pair> - two character string for pair to be used.
        -- By default pair is not inserted after `\`, quotes are not recognized by
        -- `<CR>`, `'` does not insert pair after a letter.
        -- Only parts of tables can be tweaked (others will use these defaults).
        mappings = {
                [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
                ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
                ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },
                ["["] = {
                        action = "open",
                        pair = "[]",
                        neigh_pattern = ".[%s%z%)}%]]",
                        register = { cr = false },
                        -- foo|bar -> press "[" -> foo[bar
                        -- foobar| -> press "[" -> foobar[]
                        -- |foobar -> press "[" -> [foobar
                        -- | foobar -> press "[" -> [] foobar
                        -- foobar | -> press "[" -> foobar []
                        -- {|} -> press "[" -> {[]}
                        -- (|) -> press "[" -> ([])
                        -- [|] -> press "[" -> [[]]
                },
                ["{"] = {
                        action = "open",
                        pair = "{}",
                        -- neigh_pattern = ".[%s%z%)}]",
                        neigh_pattern = ".[%s%z%)}%]]",
                        register = { cr = false },
                        -- foo|bar -> press "{" -> foo{bar
                        -- foobar| -> press "{" -> foobar{}
                        -- |foobar -> press "{" -> {foobar
                        -- | foobar -> press "{" -> {} foobar
                        -- foobar | -> press "{" -> foobar {}
                        -- (|) -> press "{" -> ({})
                        -- {|} -> press "{" -> {{}}
                },
                ["("] = {
                        action = "open",
                        pair = "()",
                        -- neigh_pattern = ".[%s%z]",
                        neigh_pattern = ".[%s%z%)]",
                        register = { cr = false },
                        -- foo|bar -> press "(" -> foo(bar
                        -- foobar| -> press "(" -> foobar()
                        -- |foobar -> press "(" -> (foobar
                        -- | foobar -> press "(" -> () foobar
                        -- foobar | -> press "(" -> foobar ()
                },
                -- Single quote: Prevent pairing if either side is a letter
                ['"'] = {
                        action = "closeopen",
                        pair = '""',
                        neigh_pattern = "[^%w\\][^%w]",
                        register = { cr = false },
                },
                -- Single quote: Prevent pairing if either side is a letter
                ["'"] = {
                        action = "closeopen",
                        pair = "''",
                        neigh_pattern = "[^%w\\][^%w]",
                        register = { cr = false },
                },
                -- Backtick: Prevent pairing if either side is a letter
                ["`"] = {
                        action = "closeopen",
                        pair = "``",
                        neigh_pattern = "[^%w\\][^%w]",
                        register = { cr = false },
                },
        },
})
require "mini.ai".setup({ n_lines = 500 })

local MiniFiles = require "mini.files"

MiniFiles.setup({
    mappings = {
        go_in = "l",
        go_in_plus = "<CR>",
        go_out = "h",
        go_out_plus = "H"
    }
})

vim.keymap.set("n", "<leader>ee", "<cmd>lua MiniFiles.open()<CR>")
vim.keymap.set("n", "<leader>ef", function ()
    MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
    MiniFiles.reveal_cwd()
end)
