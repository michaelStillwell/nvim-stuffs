require 'bindings/default'

Fns.Nmap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
Fns.Nmap('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
Fns.Nmap('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
Fns.Nmap('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
Fns.Nmap('n', 'gw', ':lua vim.lsp.buf.workspace_symbol()<CR>')
Fns.Nmap('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
Fns.Nmap('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
Fns.Nmap('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
Fns.Nmap('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
Fns.Nmap('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
Fns.Nmap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
Fns.Nmap('n', 'g<CR>', ':lua vim.diagnostic.open_float()<CR>')

Fns = {
  OnAttach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  end
}

return Fns
