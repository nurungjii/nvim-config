local g = vim.g
local opt = vim.opt

-- Global bindings
g.mapleader = " "

-- Colorscheme
opt.background = 'dark'

-- show rnu and nu and fix backspacing
opt.backspace = '2'
opt.relativenumber = true
opt.numberwidth = 2

-- tab stuff
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2  
opt.softtabstop = 2

--enable smart case
opt.ignorecase = true
opt.smartcase = true

-- Don't show ugly ~ when lines below on screen
opt.fillchars = { eob = " " }

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

opt.laststatus = 3

-- Personal autocmds

local nauto = vim.api.nvim_create_autocmd
local ngroup = vim.api.nvim_create_augroup

ngroup('bufcheck', {clear = true})

--Reload config on restart
nauto('BufWritePost', {
	group = 'bufcheck',
	pattern  = vim.env.MYVIMRC,
	command  = 'silent source %' })


--Start cursor at last open position
nauto('BufReadPost',  {
	group = 'bufcheck',
	pattern  = '*',
	callback = function()
		if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
			vim.fn.setpos('.', vim.fn.getpos("'\""))
			vim.api.nvim_feedkeys('zz', 'n', true)
		end end })


-- Save buffer when unfocused
nauto('FocusLost', {
	group = 'bufcheck',
	pattern = '*',
	command = 'silent! wa' })
