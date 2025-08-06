require "mason".setup()
require "oil".setup()
require "fidget".setup({})
require "mini.pick".setup()
require "mini.icons".setup()
require "mini.surround".setup()
require "blink-cmp".setup({
  keymap = { preset = 'default' },
  appearance = { use_nvim_cmp_as_default = false },
  signature = { enabled = true }
})

require "configs.ufo"
