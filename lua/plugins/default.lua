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

-- Packages
packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'morhetz/gruvbox'

  -- Vim Wiki
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

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- Neovim Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons'
    },
    config = function() require'nvim-tree'.setup {} end
  }

  use 'nvim-treesitter/nvim-treesitter'
  use 'neovim/nvim-lspconfig' -- native LSP support
  use 'williamboman/nvim-lsp-installer' -- LSP installer
  use 'mfussenegger/nvim-dap' -- Debug Adapter Protocol

  -- Completion
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'

  -- Snippets
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  -- todo viewer
  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require('todo-comments').setup {
        -- configuration goes here
      }
    end
  }

  -- tabs
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Markdown Stuff

  -- this plugin isn't working for some reason?
  use {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && yarn install',
    setup = function()
      vim.g.mkdp_filestypes = {
        'markdown'
        }
    end,
    ft = { 'markdown' }
  }

end)

-- Coloscheme
vim.cmd [[ colorscheme gruvbox ]]

-- this is supposed to work, but it only changes
-- the variable value and not the acutal colorschme
-- vim.g.colors_name = 'gruvbox'


-- TODO: move this
local cmp = require('cmp')

--[[
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  },
  mapping = {
    ['<C-space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    --['<C-b>'] = cmp.mapping(cmp.mapping.scrolldocs(-4), { 'i', 'c' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }
  })
})
]]--

cmp.setup({
  completion = {
    autocomplete = false
  }
})

_G.vimrc = _G.vimrc or {}
_G.vimrc.cmp = _G.vimrc.cmp or {}
_G.vimrc.cmp.lsp = function()
  cmp.complete({
    config = {
      sources = {
        { name = 'nvim_lsp'}
      }
    }
  })
end

_G.vimrc.cmp.snippets = function()
  cmp.complete({
    config = {
      sources = {
        { name = 'vsnip' }
      }
    }
  })
end

vim.cmd [[
inoremap <C-x><C-o> <Cmd>lua vimrc.cmp.lsp()<CR>
]]
