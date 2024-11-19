-- exit insert mode with 'jk'
local options = { noremap = true }
vim.keymap.set("i", "jk", "<Esc>", options)

-- Code formatting
vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, { remap = false })

-- FTerm
vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Code formatting
vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, { remap = false })

