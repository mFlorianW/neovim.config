local opt = vim.opt
local api = vim.api

-- line-numbers options
opt.relativenumber = true
opt.number = true

-- tabs and intendentation
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true

-- line wrap
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = false

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace 
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- splitwindows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- colorcolumn
opt.colorcolumn = "120"

-- timeout for commands
opt.timeoutlen = 250
