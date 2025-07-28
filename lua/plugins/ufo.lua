return {
  {
    'kevinhwang91/nvim-ufo',
    event = 'LspAttach',
    -- keys migrated to lua/config/keymaps.lua
    dependencies = {
      { 'kevinhwang91/promise-async' },
      {
        'luukvbaal/statuscol.nvim',
        config = function(opts)
          local builtin = require 'statuscol.builtin'
          require('statuscol').setup {
            -- foldfunc = 'builtin',
            -- setopt = true,
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = 'v:lua.ScFa' },
              { text = { '%s' }, click = 'v:lua.ScSa' },
              { text = { builtin.lnumfunc, ' ' }, click = 'v:lua.ScLa' },
            },
          }
        end,
      },
    },
    config = function()
      -- Fold options
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      vim.o.foldcolumn = '1' -- '0' is not bad
      vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local suffix = (' 󰁂 %d '):format(endLnum - lnum)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, {suffix, 'MoreMsg'})
        return newVirtText
      end

      require('ufo').setup({
        -- vim.cmd('highlight UfoFoldedBg guibg=none'),
        fold_virt_text_handler = handler,
        close_fold_kinds_for_ft = {
          default = {'imports', 'comment'},
          json = {'array'},
          c = {'comment', 'region'}
        },
      })
    end,
  },
}

