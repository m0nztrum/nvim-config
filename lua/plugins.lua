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
use ({'rose-pine/neovim', as = 'rose-pine'})
use 'catppuccin/nvim'
use 'davidosomething/vim-colors-meh'

--        [nvim tree]
use 'nvim-tree/nvim-tree.lua'

--        [Undo Tree]
use("mbbill/undotree")

--      [Web devicons]
use 'nvim-tree/nvim-web-devicons'

--      [treesitter]
use 'nvim-treesitter/nvim-treesitter'

--lua line
use 'nvim-lualine/lualine.nvim'

-- Telescope
use {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.0',
	requires = { {'nvim-lua/plenary.nvim'} }
}
--      [Lsp signature]
use("ray-x/lsp_signature.nvim")

--          [LSP]
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional
			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
			{ "jose-elias-alvarez/null-ls.nvim" },
		},
	})

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

--      [vim cool]
use 'romainl/vim-cool'

--      [Live-server]
-- use("manzeloth/live-server")

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

--      [Smoothie]
use 'psliwka/vim-smoothie'

--  [Add indentation guides on even blank lines]
use "lukas-reineke/indent-blankline.nvim"

--      [Notify]
use 'rcarriga/nvim-notify'

--      [Whick key]
use {'folke/which-key.nvim',
    config = function ()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end
}

--      [commentry]
use 'tpope/vim-commentary'

--[[ WEB 
--use { --  live edit html, css, and javascript in vim
		'turbio/bracey.vim',
		 run =  'npm install --prefix server',
		 ft = {'html', 'css', 'javascript'}
}
]]




  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
