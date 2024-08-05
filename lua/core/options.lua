-- Set leader to space
vim.g.maplocalleadeer = " "
vim.g.mapleader = " "

-- Line numbers / relative
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable mouse
vim.opt.mouse = ""

-- Tab widths, indents and spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Don't line wrap
vim.opt.wrap = false

--clipboard
vim.opt.clipboard = "unnamedplus"

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Better colors
vim.opt.termguicolors = true
vim.o.background = "dark"

-- Allow hidden unsaved buffers
vim.opt.hidden = true

-- Attempts to keep cursor in center of screen
vim.opt.scrolloff = 15

-- Keep a left hand column for error icons etc.
vim.opt.signcolumn = "yes"

-- Give more space for displaying messages.
vim.opt.cmdheight = 1

-- Persistent undo
vim.opt.undofile = true

-- Improve sidescroll
vim.opt.sidescroll = 1

-- cursor line
vim.opt.cursorline = false

-- Preview substitutions live, as you type!
vim.opt.inccommand = "split"

-- Configue how split windows should open
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Netrw
vim.g.netrw_liststyle = 1

-- Disable error bells
vim.opt.errorbells = false

vim.o.timeout = true
vim.o.timeoutlen = 300

-- Whitespace chars
vim.opt.listchars = { tab = "» ", trail = "~", space = "·", eol = "↵" }
vim.opt.whichwrap = "<,>,h,l,[,]"

-- faster completion
vim.o.updatetime = 100

-- turn of swapfile
vim.opt.swapfile = false

-- encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- g.python3_host_prog = "/usr/bin/python3"

-- complete the longest common match, tab the results to fully complete them
vim.opt.wildmode = "longest:full,full"

-- vim.g.yuck_lisp_indentation = 4
