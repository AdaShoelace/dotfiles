
if has("nvim")
	let g:ale_fixers = {
				\ 'zig': ['/usr/local/bin/zls/zls']
				\}

	let g:ale_linters = {
				\	'zig': ['/usr/local/bin/zls/zls'],
				\}
endif

" Use rust-analyzer as lang server
let g:LanguageClient_serverCommands = {
			\ 'zig': ['/usr/local/bin/zls/zls'],
			\}
