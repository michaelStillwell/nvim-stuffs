-- Original way
local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  local opts = {}

  if server.name == 'sumneko_lua' then
    opts = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim', 'use'}
          }
        }
      }
    }
  end

  server:setup(opts)
end)

-- Omnisharp stuff
local cmp = require ('cmp')
cmp.setup {
  mapping = {
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    })
  },
  sources = {
    { name = 'nvim_lsp' }
  }
}

require'lspconfig'.omnisharp.setup {
  capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end,
  cmd = { vim.fn.stdpath "data" .. "lsp_servers/omnisharp", "--languageserver", "--hostPID", tostring(pid) }
}

-- Auto install lsps
local server_list = {
  'sumneko_lua',
  'omnisharp'
}

for _, name in pairs(server_list) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("[Installing] " .. name)
    server:install()
  end
end
