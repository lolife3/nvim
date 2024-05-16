local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = " "

local plugins = {
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.6',
	dependencies = { 'nvim-lua/plenary.nvim' }},



	{ "nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup {
				ensure_installed = { "c", "lua", "rust", "python", "query", "vim", "vimdoc" },
				highlight = { enable = true, }}end
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" }
	},

	{ "rose-pine/neovim", name = "rose-pine" },

	{"folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },

	{ 'mbbill/undotree' },

	{ 'tpope/vim-fugitive' },

	{ "L3MON4D3/LuaSnip",
		version = "v2.*",
		build = "make install_jsregexp" },

	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},

	{'neovim/nvim-lspconfig'},

	{'hrsh7th/cmp-nvim-lsp'},

	{ 'hrsh7th/nvim-cmp' },

	{ 'L3MON4D3/LuaSnip' },

	{ "neovim/nvim-lspconfig" },

	{ "j-hui/fidget.nvim", opts = {} },

	{ "williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig", },

	{ "williamboman/mason.nvim",
	  "williamboman/mason-lspconfig.nvim",
	  "hrsh7th/cmp-nvim-lsp",
	  "hrsh7th/cmp-buffer",
	  "hrsh7th/cmp-path",
	  "hrsh7th/cmp-cmdline",
	  "hrsh7th/nvim-cmp",
	  "L3MON4D3/LuaSnip",
	  "saadparwaiz1/cmp_luasnip",
	  "j-hui/fidget.nvim",
	  "neovim/nvim-lspconfig",},

	{ "folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
		end,  opts = {}},
}

require("lazy").setup({
	spec = "config.lazy",
	change_detection = { notify = false },
})
