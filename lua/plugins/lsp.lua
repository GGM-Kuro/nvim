return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
    opts = {
      servers = {
        marksman = {},
      },
      ensure_istalled = { "markdownlint", "marksman" },
      ui = {
        border = "rounded",
      }
    },
    dependencies = {
      -- bridges the gap between mason and lspconfig
      "williamboman/mason-lspconfig.nvim",
      lazy = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    opts = {
      servers = {
        marksman = {},
      }
    },
    config = function()
      require 'kuro.lsp'
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind.nvim",
      "folke/lsp-colors.nvim",
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
      { "j-hui/fidget.nvim", tag = "legacy" },
    }
  },
}
