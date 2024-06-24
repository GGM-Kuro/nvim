return {
  "folke/trouble.nvim",
  enabled = true,
  dependencies = "kyazdani42/nvim-web-devicons",
  keys = {
    { "<leader><leader>s", "<cmd>Trouble symbols toggle focus=true<cr>", desc = "Symbols" }
  },
  config = true,
  opts = {
    symbols = {
      mode = 'symbols',
      focus = true
    }
  }
}

