
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
"runtime! debian.vim


"All Vundle down to the line

set nocompatible              " be iMproved, required
"filetype off                  " required
call plug#begin('~/.config/nvim/bundle')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
"Plug 'slashmili/alchemist.vim', {'for': ['elixir', 'eelixir']}
Plug 'elixir-editors/vim-elixir'
Plug 'autozimu/LanguageClient-neovim', {
			\ 'branch': 'next',
			\ 'do': 'bash install.sh'
			\}
"nim autocomplete
"Plug 'fatih/vim-go'
Plug 'luochen1990/rainbow'
Plug 'junegunn/goyo.vim'
Plug 'rhysd/vim-crystal'
Plug 'scrooloose/nerdtree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'YorickPeterse/happy_hacking.vim'
Plug 'rust-lang/rust.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'dyng/ctrlsf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'dart-lang/dart-vim-plugin'
Plug 'airblade/vim-rooter'
"Plug 'rhysd/vim-clang-format'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plug 'reasonml-editor/vim-reason-plus'

"code stats tracker
Plug 'https://gitlab.com/code-stats/code-stats-vim.git'

" Multi-entry selection UI. FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

augroup filetype_rust
	autocmd!
	autocmd BufReadPost *.rs setlocal filetype=rust
augroup END

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary='/home/ada/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='/home/ada/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'

let g:rainbow_active = 1
let g:goyo_linenr = 1
"filetype plugin indent on    " required
"all Vundle above----------

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" original placement of runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
	syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

set nu rnu

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

"Indentation configuration
set tabstop=4
set softtabstop=4
set shiftwidth=4

set background=dark

if has('nvim') || has('termguicolors')
	set termguicolors
endif

colorscheme challenger_deep

setlocal foldmethod=syntax
set foldlevelstart=99

"Disabling arrowkeys
imap <Up> <NOP>
imap <Down> <NOP>
imap <Left> <NOP>
imap <Right> <NOP>
map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>

"mapping jk to <esc>
inoremap jk <esc>

"enable copy to clipboard with "+yy
set clipboard+=unnamedplus

"scrolloff
set scrolloff=5


"256 colors
set t_Co=256

"highlight line cursor is currently on
set cursorline

"Autoformat map
nmap <S-f> :Autoformat<CR>

let g:racer_cmd = "/home/ada/.cargo/bin/racer"

let g:airline_powerline_fonts = 1

"  'rust': ['cargo'],
"
"ale linter dictrionary
if has("nvim")
	let g:ale_rust_cargo_use_check = 1
	let g:ale_rust_rls_executable = 'rls'
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
				"\	'rust': ['cargo'],
	let g:ale_linters = {
				\	'rust': ['analyzer'],
				\	'cpp': ['gcc'],
				\	'c': ['avr-gcc'],
				\	'go': ['gofmt', 'golint', 'go vet'],
				\	'javascript': ['eslint'],
				\	'python': ['/usr/bin/pyls']
				\}
endif

			"\ 'rust': ['~/.cargo/bin/rustup', 'run', 'nightly', 'rls'],
let g:LanguageClient_serverCommands = {
			\ 'rust': ['rust-analyzer'],
			\ 'python': ['/usr/bin/pyls'],
			\ 'cpp': ['clangd'],
			\ 'c': ['clangd'],
			\ 'crystal': ['/home/ada/Programming/crystal/scry'],
			\}

let g:LanguageClient_autoStart = 1

" Maps K to hover, gd to goto definition, F2 to rename
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
nnoremap <silent> <F7> :call LanguageClient_textDocument_references()<CR>
nnoremap <silent> <C-K> :call LanguageClient_textDocument_codeAction()<CR>
nnoremap <silent> <C-S> :call LanguageClient_textDocument_implementation()<CR>

"command to open term
command Vterm execute "vsp | term"

"code stats API key
let g:codestats_api_key = 'SFMyNTY.VFdGemRHVnlRbUZwZEE9PSMjTWpnNU13PT0.IqiHcOLg7lR9G4PgdOn7TyB7f91kar4SLfxlHLjXF50'

"remap exit virtual terminal
tnoremap <C-j><C-k> <C-\><C-n>

"vim rooter project identifier
let g:rooter_patterns = ['.git/']

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep 
	set grepformat=%f:%l:%c:%m
endif
