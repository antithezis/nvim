--- Custom mark API.
--- Implementation slightly inspired by https://github.com/chentoast/marks.nvim, but this is
--- much simpler.

--- Map of mark information per buffer.
---@type table<integer, table<string, {line: integer, id: integer}>>
local marks = {}

--- Keeps track of the signs I've already created.
---@type table<string, boolean>
local sign_cache = {}

--- The sign and autocommand group name.
local sign_group_name = 'mariasolos/marks_signs'

---@param mark string
---@return boolean
local function is_lowercase_mark(mark)
    return 97 <= mark:byte() and mark:byte() <= 122
end

---@param mark string
---@return boolean
local function is_uppercase_mark(mark)
    return 65 <= mark:byte() and mark:byte() <= 90
end

---@param mark string
---@return boolean
local function is_letter_mark(mark)
    return is_lowercase_mark(mark) or is_uppercase_mark(mark)
end

---@param mark string
---@param bufnr integer
local function delete_mark(mark, bufnr)
    local buffer_marks = marks[bufnr]
    if not buffer_marks or not buffer_marks[mark] then
        return
    end

    -- Remove the sign.
    vim.fn.sign_unplace(sign_group_name, { buffer = bufnr, id = buffer_marks[mark].id })
    buffer_marks[mark] = nil

    -- Remove the mark.
    vim.cmd('delmarks ' .. mark)
end

---@param mark string
---@param bufnr integer
---@param line? integer
local function register_mark(mark, bufnr, line)
    local buffer_marks = marks[bufnr]
    if not buffer_marks then
        return
    end

    if buffer_marks[mark] then
        -- Mark already exists, remove it first.
        delete_mark(mark, bufnr)
    end

    -- Remove any other mark on the same line
    line = line or vim.api.nvim_win_get_cursor(0)[1]
    for other_mark, data in pairs(buffer_marks) do
        if other_mark ~= mark and data.line == line then
            delete_mark(other_mark, bufnr)
        end
    end

    -- Add the sign to the tracking table.
    local id = mark:byte() * 100
    buffer_marks[mark] = { line = line, id = id }

    -- Create the sign.
    local sign_name = 'Marks_' .. mark
    local texthl
    if is_lowercase_mark(mark) then
        texthl = 'MarksLowercase'
    elseif is_uppercase_mark(mark) then
        texthl = 'MarksUppercase'
    else
        texthl = 'DiagnosticSignOk'
    end
    if not sign_cache[sign_name] then
        vim.fn.sign_define(sign_name, { text = mark, texthl = texthl })
        sign_cache[sign_name] = true
    end
    vim.fn.sign_place(id, sign_group_name, sign_name, bufnr, {
        lnum = line,
        priority = 10,
    })
end

---@param bufnr integer
local function set_keymaps(bufnr)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'm', '', {
        desc = 'Add mark',
        callback = function()
            local ok, mark = pcall(function()
                return vim.fn.getcharstr()
            end)
            if not ok or not is_letter_mark(mark) then
                return
            end

            register_mark(mark, bufnr)
            vim.cmd('normal! m' .. mark)
        end,
    })

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'dm', '', {
        desc = 'Delete mark',
        callback = function()
            local ok, mark = pcall(function()
                return vim.fn.getcharstr()
            end)
            if not ok or not is_letter_mark(mark) then
                return
            end

            delete_mark(mark, bufnr)
        end,
    })

    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'dm-', '', {
        desc = 'Delete all buffer marks',
        callback = function()
            marks[bufnr] = {}
            vim.fn.sign_unplace(sign_group_name, { buffer = bufnr })
            vim.cmd 'delmarks!'
        end,
    })
end

-- Define highlight groups for mark signs (customize in your colorscheme if desired)
vim.cmd [[
    highlight default MarksLowercase ctermfg=Green guifg=Green
    highlight default MarksUppercase ctermfg=Yellow guifg=Yellow
]]

-- Helper to refresh all marks for a buffer
local function refresh_marks(bufnr)
    if not marks[bufnr] then
        marks[bufnr] = {}
    end
    -- Remove all marks that were deleted or changed case.
    local current_marks = {}
    for _, data in ipairs(vim.fn.getmarklist()) do
        local mark = data.mark:sub(2, 3)
        current_marks[mark] = true
    end
    for _, data in ipairs(vim.fn.getmarklist '%') do
        local mark = data.mark:sub(2, 3)
        current_marks[mark] = true
    end
    for mark, data in pairs(marks[bufnr]) do
        local markinfo = vim.api.nvim_buf_get_mark(bufnr, mark)
        if markinfo[1] == 0 or not current_marks[mark] then
            delete_mark(mark, bufnr)
        else
            -- Si la marca sigue existiendo pero cambió de línea, solo actualiza la posición y el signo
            if data.line ~= markinfo[1] then
                data.line = markinfo[1]
                local sign_name = 'Marks_' .. mark
                vim.fn.sign_unplace(sign_group_name, { buffer = bufnr, id = data.id })
                vim.fn.sign_place(data.id, sign_group_name, sign_name, bufnr, {
                    lnum = data.line,
                    priority = 10,
                })
            end
            -- Detect case change: if the mark type changed (lowercase <-> uppercase), re-register
            local is_lower = is_lowercase_mark(mark)
            local is_upper = is_uppercase_mark(mark)
            local sign_name = 'Marks_' .. mark
            local sign_hl = nil
            if is_lower then sign_hl = 'MarksLowercase' end
            if is_upper then sign_hl = 'MarksUppercase' end
            local placed_sign = vim.fn.sign_getdefined(sign_name)[1]
            if placed_sign and placed_sign.texthl ~= sign_hl then
                delete_mark(mark, bufnr)
                register_mark(mark, bufnr, markinfo[1])
            end
        end
    end
    -- Register the letter marks.
    for _, data in ipairs(vim.fn.getmarklist()) do
        local mark = data.mark:sub(2, 3)
        local mark_buf, mark_line = unpack(data.pos)
        local cached_mark = marks[bufnr][mark]
        if mark_buf == bufnr and is_uppercase_mark(mark) and (not cached_mark or mark_line ~= cached_mark.line) then
            register_mark(mark, bufnr, mark_line)
        end
    end
    for _, data in ipairs(vim.fn.getmarklist '%') do
        local mark = data.mark:sub(2, 3)
        local mark_line = data.pos[2]
        local cached_mark = marks[bufnr][mark]
        if is_lowercase_mark(mark) and (not cached_mark or mark_line ~= cached_mark.line) then
            register_mark(mark, bufnr, mark_line)
        end
    end
end

-- Set up autocommands to refresh the signs.
vim.api.nvim_create_autocmd('BufWinEnter', {
    group = vim.api.nvim_create_augroup(sign_group_name .. '_refresh', { clear = false }),
    callback = function(args)
        local bufnr = args.buf
        -- Only handle normal buffers.
        if vim.bo[bufnr].bt ~= '' then
            return true
        end
        -- Set custom mappings.
        set_keymaps(bufnr)
        refresh_marks(bufnr)
    end,
})

-- Refresh marks on TextChanged, CmdlineLeave, CursorHold, BufWritePost
vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI', 'CursorHold', 'BufWritePost', 'CmdlineLeave' }, {
    group = vim.api.nvim_create_augroup(sign_group_name .. '_refresh2', { clear = false }),
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        refresh_marks(bufnr)
    end,
})


