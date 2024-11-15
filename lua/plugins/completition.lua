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
    "hrsh7th/cmp-emoji",
    -- "rcarriga/cmp-dap",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-git",
    -- Snippets engine
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      -- config = function ()
      --   require "kuro.luasnip"
      -- end,
      dependencies = {
        -- "saadparwaiz1/cmp_luasnip",
        -- "honza/vim-snippets",
        -- 'SirVer/ultisnips',
          -- {
          --   'quangnguyen30192/cmp-nvim-ultisnips',
          --   config = function()
          --     require("cmp_nvim_ultisnips").setup{}
          --   end
          -- },
           -- snippets
           -- "rafamadriz/friendly-snippets",
      },
    },
    "mattn/emmet-vim",
  },
}
