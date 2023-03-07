local opt = vim.opt

opt.autoindent = true -- maintain indent of current line
opt.breakindent = true -- continue indent visually
opt.number = true -- show line number
opt.relativenumber = true -- show relative line numbers
opt.scrolloff = 5 -- start scrolling 5 lines from bottom
opt.smartcase = true
opt.smarttab = true
opt.inccommand = "split" -- line preview of :s results
opt.incsearch = true -- do incremental search
opt.laststatus = 2 -- always show status line

vim.cmd('colorscheme carbonfox')
