-- Auto install packer
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  }
  print '[Installing] packer.nvim'
  vim.cmd [[packadd packer.nvim]]
end


-- Autocommand to reload when plugins/default.lua is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


-- Protected call to avoid seeing error on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end
  }
}


packer.startup(function(use)
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

  -- Neovim Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function() require'nvim-tree'.setup {} end
  }

end)

-- Coloscheme
vim.cmd [[ colorscheme gruvbox ]]

-- this is supposed to work, but it only changes
-- the variable value and not the acutal colorschme
-- vim.g.colors_name = 'gruvbox'

