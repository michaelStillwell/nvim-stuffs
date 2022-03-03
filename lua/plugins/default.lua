require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tomasr/molokai'
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
vim.g.colors_name = 'molokai'

-- Configs

