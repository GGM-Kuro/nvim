return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    -- bridges the gap between mason and lspconfig
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      require 'kuro.lsp'
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind.nvim",

      { "j-hui/fidget.nvim", tag = "legacy" },
      -- support for dart hot reload on save
      -- "RobertBrunhage/dart-tools.nvim",
      {
        'akinsho/flutter-tools.nvim',
        lazy = false,
        dependencies = {
          'nvim-lua/plenary.nvim',
          'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = true,
      }
    },
  },
}
