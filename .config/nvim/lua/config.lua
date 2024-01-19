-- leader
vim.g.mapleader = ","

-- indentation
local tabwidth = 8

vim.opt.tabstop = tabwidth
vim.opt.shiftwidth = tabwidth
vim.opt.expandtab = false
vim.opt.smarttab = true

-- clean trailing whitespace
vim.api.nvim_create_autocmd(
	{ 'BufWritePre' },
	{
		command = [[%s/\s\+$//e]]
	}
)

-- line numbers
vim.cmd.set('nu rnu')
vim.opt.cursorcolumn = false
vim.opt.cursorline = false

-- colours
vim.opt.termguicolors = true
vim.opt.background = 'dark'
vim.cmd.colorscheme('gruvbox-material')

vim.keymap.set("n", "<leader>t", function()
	print("test worked")
end)

-- mouse
vim.opt.mouse = ""
