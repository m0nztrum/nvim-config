local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

-- My plugins

--Gruvbox theme
use 'ellisonleao/gruvbox.nvim'

--nvim tree
use 'nvim-tree/nvim-tree.lua'

--Web devicons
use 'nvim-tree/nvim-web-devicons'

--treesitter
use 'nvim-treesitter/nvim-treesitter'

--lua line
use 'nvim-lualine/lualine.nvim'

-- Telescope
use {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.0',
	requires = { {'nvim-lua/plenary.nvim'} }
}

--LSP
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
use 'neovim/nvim-lspconfig'

--Autocompletions and Snippet
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'
use 'rafamadriz/friendly-snippets'

--Git
use 'lewis6991/gitsigns.nvim'

--Markdown
--use 'davidgranstrom/nvim-markdown-preview'

-- Live-server
use("manzeloth/live-server")


-- autopair
use({
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({})
	end,
})

-- Transparent - allows for toggle
use ("xiyaowong/nvim-transparent")

--barbar
use 'romgrk/barbar.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
