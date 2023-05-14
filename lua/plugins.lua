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

-- MY PLUGINS --

--          [Theme]
use 'ellisonleao/gruvbox.nvim'
use 'water-sucks/darkrose.nvim'
use 'EdenEast/nightfox.nvim'

--        [nvim tree]
use 'nvim-tree/nvim-tree.lua'

--        [Undo Tree]
use("mbbill/undotree")

--      [Web devicons]
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

--          [LSP]
use 'williamboman/mason.nvim'
use 'williamboman/mason-lspconfig.nvim'
use 'neovim/nvim-lspconfig'
use("ray-x/lsp_signature.nvim") --lsp signature

--      [Autocompletions and Snippet]
use 'hrsh7th/nvim-cmp'
use 'hrsh7th/cmp-nvim-lsp'
use 'hrsh7th/cmp-buffer'
use 'hrsh7th/cmp-path'
use 'L3MON4D3/LuaSnip'
use 'saadparwaiz1/cmp_luasnip'
use 'rafamadriz/friendly-snippets'

--          [Ale]
use 'dense-analysis/ale'

--          [autopair]
use({
	"windwp/nvim-autopairs",
	config = function()
		require("nvim-autopairs").setup({})
	end,
})


--          [Git]
use 'lewis6991/gitsigns.nvim' -- gitsigns
use "airblade/vim-gitgutter" -- gitgutter
use("tpope/vim-fugitive") -- fugitive
use "tpope/vim-rhubarb"

--       [Markdown]
use({
	"iamcco/markdown-preview.nvim",
	run = function()
		vim.fn["mkdp#util#install"]()
	end,
})

--      [Live-server]
use("manzeloth/live-server")

--      [Fidget]
use({
	"j-hui/fidget.nvim",
	config = function()
		require("fidget").setup({
			text = {
				spinner = "bouncing_ball",
			},
			window = {
				border = "rounded",
				blend = 0,
			},
		})
	end,
})


--      [Transparent - allows for toggle]
use ("xiyaowong/nvim-transparent")

--          [barbar]
use 'romgrk/barbar.nvim'

--          [Vgit]
use {
  'tanvirtin/vgit.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  }
}
--  [Terminal in the floating/popup window.]
use	'akinsho/toggleterm.nvim'

--      [Wilder]
use("gelguy/wilder.nvim")


--  [Add indentation guides on even blank lines]
use "lukas-reineke/indent-blankline.nvim"

--      [Notify]
use 'rcarriga/nvim-notify'

-- [Games] -- for procrastination duhhh
use 'eandrju/cellular-automaton.nvim'

--          [ WEB ]
use { --  live edit html, css, and javascript in vim
		'turbio/bracey.vim',
		 run =  'npm install --prefix server',
		 ft = {'html', 'css', 'javascript'}
}





--use 'MarcHamamji/runner.nvim'



  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
