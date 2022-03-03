-- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})
-- ==========================


local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }


-- Esc
keymap('i', '<leader><leader>', '<Esc>', {})
keymap('i', '<leader><leader>', '<Esc>', {})
keymap('v', '<leader><leader>', '<Esc>', {})
keymap('n', '<leader><leader>', '<Esc>', {})

-- Save file with Ctrl-S
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>', {})

-- Window Movement
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Close window
keymap('n', '<leader>q', ':q<CR>', opts)

-- Open Vex
keymap('n', '<leader>e', ':Vex<CR>', {})

-- Open settings.lua
keymap('n', '<leader>pv', ':e $HOME/.config/nvim/general/settings.lua<CR>', {})

