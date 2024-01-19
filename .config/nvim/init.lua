-- lazy.nvim -> https://github.com/folke/lazy.nvim

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

local plugins = {
	{ -- theme (material gruvbox)
		"sainnhe/gruvbox-material",
		name = "gruvbox-material",
	},

	{ -- tree shitter
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate" -- auto-update tree shitter
	},

	{ -- indentation guides
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	{
		"williamboman/mason-lspconfig.nvim"
	},

	{ -- mason
		"williamboman/mason.nvim"
	},
	{ -- mason lsp config
		"williamboman/mason-lspconfig.nvim"
	},
	{ -- lsp config
		"neovim/nvim-lspconfig"
	},

	{ -- wakatime stats tracking (so i can point out my nvim stats (btw))
		"wakatime/vim-wakatime",
		lazy = false
	},
	{ -- discord status
		"andweeb/presence.nvim"
	},


	{ -- plenary
		"plenary.async"
	},

	-- snip for cmp
	{
		"saadparwaiz1/cmp_luasnip"
	},
	{
		"L3MON4D3/LuaSnip"
	},

	-- cmp
	{
		"hrsh7th/nvim-cmp"
	},
	{
		"hrsh7th/cmp-nvim-lsp"
	},
	{
		"hrsh7th/cmp-buffer"
	},
	{
		"hrsh7th/cmp-path"
	},
	{
		"hrsh7th/cmp-cmdline"
	},
	{
		"petertriho/cmp-git"
	},

	-- fmt + lint
	{
		"nvimtools/none-ls.nvim"
	},
	{
		"jay-babu/mason-null-ls.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
	},

	{ -- spider for w, e, b navigation
		"chrisgrieser/nvim-spider"
	},
	-- todo:
	-- https://dotfyle.com/plugins/nvim-lualine/lualine.nvim
	-- christoomey/vim-tmux-navigator
}

local opts = {}

require("lazy").setup(plugins, opts)

-- config
require("config")

-- netrw config, built in so not in lazy
require("plugins.netrw")

-- tree shitter
require("plugins.treeshitter")

-- indentation guides
require("ibl").setup()

-- mason, and related
require("plugins.lsp")

-- presence
require("plugins.presence")

-- nvim-spider
require("plugins.spider")
