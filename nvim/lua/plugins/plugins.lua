return {
	"vim-airline/vim-airline",
	"vim-airline/vim-airline-themes",
	"scrooloose/nerdtree",
	"fatih/vim-go",
	"tpope/vim-surround",
	"jiangmiao/auto-pairs",
	"ctrlpvim/ctrlp.vim",
	{ "junegunn/fzf", build = "./install --bin" },
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"numToStr/FTerm.nvim",
	"morhetz/gruvbox",
	"svermeulen/vimpeccable",
	-- Rust
	"simrat39/rust-tools.nvim",
	-- Mason
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
		end,
	},
	"mfussenegger/nvim-jdtls",
	-- Completion framework:
	"hrsh7th/nvim-cmp",

	-- LSP completion source:
	"hrsh7th/cmp-nvim-lsp",

	-- Useful completion sources:
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/vim-vsnip",

	"nvim-treesitter/nvim-treesitter",
	"puremourning/vimspector",

	-- Slint support
	"slint-ui/vim-slint",
}
