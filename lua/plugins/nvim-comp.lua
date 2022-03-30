
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities  = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local cmpsnip = require('cmp-snip')

local cmp = require 'cmp'
cmp.setup = {
  snippet = {
    expand = function(args)
      
    end
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),

  }
}
