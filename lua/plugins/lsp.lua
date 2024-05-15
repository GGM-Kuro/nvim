return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = true,
    -- config = function()
    --   require("mason").setup()
    -- end,
    dependencies = {
      -- bridges the gap between mason and lspconfig
      "williamboman/mason-lspconfig.nvim",
      lazy = false,
    },
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
        keys = {
          { ";fx", ":FlutterRun<cr>",         desc = "run" },
          { ";fd", ":FlutterDevices<cr>",     desc = "devices" },
          { ";fe", ":FlutterEmulators<cr>",   desc = "emulators" },
          { ";fq", ":FlutterQuit<cr>",        desc = "quit" },
          { ";fr", ":FlutterReload<cr>",      desc = "hotReload" },
          { ";fR", ":FlutterRestart<cr>",     desc = "hotRestart" },
          { ";fD", ":FlutterVisualDebug<cr>", desc = "debug" }
        },
        dependencies = {
          'nvim-lua/plenary.nvim',
          'stevearc/dressing.nvim', -- optional for vim.ui.select
        },
        config = function()
          require 'kuro.flutter'
        end
      }
    },
  },
}
