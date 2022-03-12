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

-- Auto install lsps
local server = {
  'sumneko_lua',
  'omnisharp'
}

for _, name in pairs(server) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("[Installing] " .. name)
    server:install()
  end
end
