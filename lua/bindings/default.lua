-- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})
-- ==========================


local vim_path = "~/.config/nvim/"

-- Functions
local function map(mode, shortcut, command, options)
  local opts = options
  if (options == nil) then opts = {} end
  vim.api.nvim_set_keymap(mode, shortcut, command, opts)
end

local function nmap(mode, shortcut, command)
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

-- Because Ctrl-Y isn't working right
nmap('n', '<S-y>', 'Vy<Esc>')

-- Select all
map('n', '<c-a>', 'ggVG', {})

-- Window Movement
nmap('n', '<c-j>', '<c-w>j')
nmap('n', '<c-h>', '<c-w>h')
nmap('n', '<c-k>', '<c-w>k')
nmap('n', '<c-l>', '<c-w>l')

-- Close window
nmap('n', '<leader>q', ':q<CR>')

-- Close all windows
nmap('n', '<leader>qq', ':qa<CR>')

-- Open File Explorer
nmap('n', '<leader>', ':NvimTreeToggle<CR>')

-- Open settings.lua
nmap('n', '<leader>pv', ':e ' .. vim_path .. 'lua/settings.lua<CR>')


-- From LunarVim/Neovim-from-scratch
nmap('n', '<C-Up>', ':resize +2<CR>')
nmap('n', '<C-Up>', ':resize +2<CR>')
nmap('n', '<C-Left>', ':vertical resize -2<CR>')
nmap('n', '<C-Right>', ':vertical resize +2<CR>')

nmap('n', '<S-l>', ':bnext<CR>')
nmap('n', '<S-h>', ':bprevious<CR>')

nmap('v', '<', '<gv')
nmap('v', '>', '>gv')

nmap('v', '<A-j>', ':m .+1<CR>==')
nmap('v', '<A-k>', ':m .-2<CR>==')

nmap('x', 'J', ":move '>+1<CR>gv-gv")
nmap('x', 'K', ":move '<-2<CR>gv-gv")
nmap('x', '<A-j>', ":move '>+1<CR>gv-gv")
nmap('x', '<A-k>', ":move '<-2<CR>gv-gv")

nmap('t', '<C-h>', '<C-\\><C-N><C-w>h')
nmap('t', '<C-j>', '<C-\\><C-N><C-w>j')
nmap('t', '<C-k>', '<C-\\><C-N><C-w>k')
nmap('t', '<C-l>', '<C-\\><C-N><C-w>l')
