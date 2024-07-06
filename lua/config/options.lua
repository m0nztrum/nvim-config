-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Netrw
vim.g.netrw_liststyle = 1

-- Line numbers / relative
vim.opt.number = true
vim.opt.relativenumber = true

-- Disable error bells
vim.opt.errorbells = false

-- Disable mouse
vim.opt.mouse = ""

-- Tab widths
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Use spaces for indents
vim.opt.expandtab = true

-- Smart auto indenting
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Don't line wrap
vim.opt.wrap = false

-- Sync clipboard between OS and NeoVim
vim.opt.clipboard = "unnamedplus"

-- complete the longest common match, tab the results to fully complete them
vim.opt.wildmode = "longest:full,full"

-- Highlight all search matches, use incremental highlight
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Default to case insensitive search if the pattern includes uppercase letter
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Better colors
vim.opt.termguicolors = true

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

--setup for vgit
vim.o.updatetime = 300
vim.o.incsearch = false
vim.wo.signcolumn = "yes"

-- cursor line
vim.opt.cursorline = true

-- Whitespace chars
vim.opt.listchars = { tab = "» ", trail = "~", space = "·", eol = "↵" }
vim.opt.whichwrap = "<,>,h,l,[,]"

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Configue how split windows should open
vim.opt.splitright = true
vim.opt.splitbelow = true

-- turn of swapfile
vim.opt.swapfile = false

-- encoding
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- g.python3_host_prog = "/usr/bin/python3"

vim.o.background = "dark"

-- neovide options
vim.g.neovide_transparency = 0.8
