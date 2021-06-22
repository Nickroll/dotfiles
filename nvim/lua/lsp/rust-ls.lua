local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport =
    {properties = {'documentation', 'detail', 'additionalTextEdits'}}

require'lspconfig'.rust_analyzer.setup {
    cmd = {DATA_PATH .. "/lspinstall/rust/rust-analyzer"},
    capabilities = capabilities,
    on_attach = require'lsp'.common_on_attach,
    handlers = {
        ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                                                           {virtual_text = true, signs = true, update_in_insert = true})
    }
}
