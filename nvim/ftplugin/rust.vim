
let g:racer_cmd = "/home/ada/.cargo/bin/racer"
if has("nvim")
	let g:ale_rust_cargo_use_check = 1
	let g:ale_rust_rls_config = {
				\ 'rust': {
				\ 'all_targets':1,
				\ 'build_on_save': 1,
				\ 'clippy_preference': 'on'
				\}
				\}
	let g:ale_fixers = {
				\ 'rust': ['rustfmt']
				\}
	let g:ale_rust_use_clippy = 1
	let g:ale_rust_cargo_clippy = executable('cargo-clippy')

	let g:ale_linters = {
				\	'rust': ['analyzer'],
				\}
endif

" Use rust-analyzer as lang server
let g:LanguageClient_serverCommands = {
			\ 'rust': ['rust-analyzer'],
			\}
