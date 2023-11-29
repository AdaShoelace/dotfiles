local lspconfig = require('lspconfig')
lspconfig.tsserver.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        completions = {
            completeFunctionsCalls = true
        }
    }
}
