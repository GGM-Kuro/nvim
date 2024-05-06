return{
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-git",
        "saadparwaiz1/cmp_luasnip",
        "windwp/nvim-autopairs",
      },
      event = "VeryLazy",
      main = "kuro.cmp",
      config = true,
    }

