-- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})
-- ==========================


local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
local vim_path = "~/AppData/Local/nvim/"

-- Functions
function map(mode, shortcut, command, options)
  local opts = options
  if (options == nil) then opts = {} end
  vim.api.nvim_set_keymap(mode, shortcut, command, opts)
end

function nmap(mode, shortcut, command)
  local opts = { noremap = true, silent = true }
  map(mode, shortcut, command, opts)
end

-- Esc
map('i', '<leader><leader>', '<Esc>', {})
map('v', '<leader><leader>', '<Esc>', {})
map('n', '<leader><leader>', '<Esc>', {})

-- Save file with Ctrl-S
map('n', '<c-s>', ':w<CR>', {})
map('i', '<c-s>', '<Esc>:w<CR>', {})

-- Select all
map('n', '<c-a>', 'ggVG', {})

-- Window Movement
map('n', '<c-j>', '<c-w>j', opts)
map('n', '<c-h>', '<c-w>h', opts)
map('n', '<c-k>', '<c-w>k', opts)
map('n', '<c-l>', '<c-w>l', opts)

-- Close window
nmap('n', '<leader>q', ':q<CR>', opts)

-- Open Vex
nmap('n', '<leader>e', ':Lex<CR>', {})

-- Open settings.lua
nmap('n', '<leader>pv', ':e ' .. vim_path .. 'lua/settings.lua<CR>', {})

