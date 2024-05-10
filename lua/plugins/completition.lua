return {
		"hrsh7th/nvim-cmp",
	config = function()
		-- COMPLETION
	  require 'kuro.completition'
	end,
	dependencies = {
		-- Autocompletion
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-git",
		-- Snippets engine
		{
			"L3MON4D3/LuaSnip",
      main =  'kuro.luasnip',
      config = true,
			dependencies = {

				"saadparwaiz1/cmp_luasnip",
				-- snippets
				"rafamadriz/friendly-snippets",
			},
		},
	},
}
