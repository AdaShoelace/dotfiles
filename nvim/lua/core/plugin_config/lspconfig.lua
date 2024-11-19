local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        completions = {
            completeFunctionsCalls = true
        }
    }
}
