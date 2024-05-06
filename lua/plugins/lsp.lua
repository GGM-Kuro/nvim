return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',

  dependencies = {
    "neovim/nvim-lspconfig",
    "onsails/lspkind.nvim",
    "folke/neodev.nvim",
    {
      "williamboman/mason.nvim",
      dependencies = "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_istalled = {
          "debugpy",
          "ruff",
        },
        ui = {
          border = 'rounded'
        },
      },
      build = ':MasonUpdate',
      config = true,
    },
      },
    config = function ()
     require "kuro.lsp"
    end,
}
