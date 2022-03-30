-- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {options})
-- ==========================


local vim_path = "~/.config/nvim/"


-- Functions
Fns = {
  Map = function (mode, shortcut, command, options)
    local opts = options
    if (options == nil) then opts = {} end
    vim.api.nvim_set_keymap(mode, shortcut, command, opts)
  end,

  Nmap = function (mode, shortcut, command)
    local opts = { noremap = true, silent = true }
    Fns.Map(mode, shortcut, command, opts)
  end
}

-- Esc
Fns.Map('i', '<leader><leader>', '<Esc>', {})
Fns.Map('v', '<leader><leader>', '<Esc>', {})
Fns.Map('n', '<leader><leader>', '<Esc>', {})

-- Save file with Ctrl-S
Fns.Map('n', '<c-s>', ':w<CR>', {})
Fns.Map('i', '<c-s>', '<Esc>:w<CR>', {})

-- Because Ctrl-Y isn't working right
Fns.Nmap('n', '<S-y>', 'Vy<Esc>')

-- Select all
Fns.Map('n', '<c-a>', 'ggVG', {})

-- Window Movement
Fns.Nmap('n', '<c-j>', '<c-w>j')
Fns.Nmap('n', '<c-h>', '<c-w>h')
Fns.Nmap('n', '<c-k>', '<c-w>k')
Fns.Nmap('n', '<c-l>', '<c-w>l')

-- Close window
Fns.Nmap('n', '<leader>q<leader>', ':q<CR>')

-- Close all windows
Fns.Nmap('n', '<leader>qq', ':qa<CR>')

-- Open File Explorer
Fns.Nmap('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Open settings.lua
Fns.Nmap('n', '<leader>pv', ':e ' .. vim_path .. 'lua/settings.lua<CR>')

-- Clear search
Fns.Nmap('n', '<leader>sc', ':noh<CR>')
Fns.Nmap('i', '<leader>sc', ':noh<CR>')
Fns.Nmap('v', '<leader>sc', ':noh<CR>')


-- From LunarVim/Neovim-from-scratch
Fns.Nmap('n', '<C-Up>', ':resize +2<CR>')
Fns.Nmap('n', '<C-Down>', ':resize -2<CR>')
Fns.Nmap('n', '<C-Left>', ':vertical resize +2<CR>')
Fns.Nmap('n', '<C-Right>', ':vertical resize -2<CR>')

Fns.Nmap('n', '<S-l>', ':bnext<CR>')
Fns.Nmap('n', '<S-h>', ':bprevious<CR>')

Fns.Nmap('v', '<', '<gv')
Fns.Nmap('v', '>', '>gv')

Fns.Nmap('v', '<A-j>', ':m .+1<CR>==')
Fns.Nmap('v', '<A-k>', ':m .-2<CR>==')

-- too wonky
--Fns.Nmap('x', 'J', ":move '>+1<CR>gv-gv")
--Fns.Nmap('x', 'K', ":move '<-2<CR>gv-gv")
--Fns.Nmap('x', '<A-j>', ":move '>+1<CR>gv-gv")
--Fns.Nmap('x', '<A-k>', ":move '<-2<CR>gv-gv")

Fns.Nmap('t', '<C-h>', '<C-\\><C-N><C-w>h')
Fns.Nmap('t', '<C-j>', '<C-\\><C-N><C-w>j')
Fns.Nmap('t', '<C-k>', '<C-\\><C-N><C-w>k')
Fns.Nmap('t', '<C-l>', '<C-\\><C-N><C-w>l')

Fns.Nmap('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<CR>')
Fns.Nmap('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>')


Fns.Nmap('n', '<leader>gr', ':lua require("telescope.builtin").lsp_references()<CR>')
Fns.Nmap('n', '<leader>gs', ':lua require("telescope.builtin").git_status()<CR>')


-- buffer tabs
Fns.Nmap('n', '[b', ':BufferLineMoveNext<CR>')
Fns.Nmap('n', 'b]', ':BufferLineMovePrev<CR>')
Fns.Nmap('n', '<leader>l', ':BufferLineCycleNext<CR>')
Fns.Nmap('n', '<leader>h', ':BufferLineCyclePrev<CR>')


-- diagnostics (warnings, errors, etc)
Fns.Nmap('n', '<leader>sd', ':lua require("telescope.builtin").diagnostics()<CR>')


local actions = require('telescope.actions')
require'telescope'.setup {
  defaults = {
    mappings = {
      i = {
        -- movement
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,

        ['<C-u>'] = false,
        ['<esc>'] = actions.close
      }
    }
  }
}

return Fns
