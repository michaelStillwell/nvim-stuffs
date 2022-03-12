local function nkeymap(key, map)
  vim.api.nvim_set_keymap('n', key, map, { noremap = true })
end


nkeymap('gd', ':lua vim.lsp.buf.definition()<CR>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<CR>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<CR>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<CR>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<CR>')
nkeymap('gr', ':lua vim.lsp.buf.references()<CR>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<CR>')
nkeymap('K', ':lua vim.lsp.buf.hover()<CR>')
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<CR>')

