-- Configs
local ts_configs = require'nvim-treesitter.configs'
ts_configs.setup {
  ensure_installed = 'maintained',
  hightlight = {
    enable = true
  },
  index = {
    enable = true
  }
}

vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldmethod = 'expr'

--[[
-- Example function to test bindings
local function blahs()
  print "hello world\n"
end

blahs()
]]--
