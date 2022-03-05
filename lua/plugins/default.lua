require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'

  use {
    'vimwiki/vimwiki',
    config = function()
      vim.g.vim_wiki_list = {
      {
          path = '~/devenv/codevion.github.io/',
          syntax = 'markdown',
          ext = 'jkkkj'
        }
      }

      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
      }
    end
  }

  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

end)

-- Coloscheme
vim.g.colors_name = 'gruvbox'

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

--local lsp_installer = require('nvim-lsp-installer')
--lsp_installer.on_server_ready(function(server)
--  local opts = {}
--  server:setup(opts)
--end)

-- Auto install lsps
local lsp_installer = require 'nvim-lsp-installer'

local server = {
  'sumneko_lua'
}

for _, name in pairs(server) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("[Installing] " .. name)
    server:install()
  end
end

