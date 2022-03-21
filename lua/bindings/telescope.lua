require 'bindings/default'

local telescope = require('telescope')
local nmap = Fns.Nmap



-- Configs
nmap('n', '<leader>ff', ':lua require("telescope.builtin").find_files()<CR>')
nmap('n', '<leader>fg', ':lua require("telescope.builtin").live_grep()<CR>')


nmap('n', '<leader>gr', ':lua require("telescope.builtin").lsp_references()<CR>')
nmap('n', '<leader>gs', ':lua require("telescope.builtin").git_status()<CR>')


-- diagnostics (warnings, errors, etc)
nmap('n', '<leader>sd', ':lua require("telescope.builtin").diagnostics()<CR>')


local actions = require('telescope.actions')
telescope.setup {
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
