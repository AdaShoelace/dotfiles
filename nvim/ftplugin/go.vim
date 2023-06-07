
" Trigger code completion on correct patterns
call deoplete#custom#option({
            \ 'sources': { 
            \       '_': ['file'],
            \       'vim': ['vim'],
            \       },
            \ 'omni_patterns': { 'go': '[^. *\t]\.\w*' }
            \ })

" Use gopls as language sever
let g:LanguageClient_serverCommands = {
			\ 'go': ['gopls'],
			\}

" Format on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

