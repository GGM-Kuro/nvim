return{
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  keys = { "<leader>n"},
  dependencies = {
   "nvim-lua/plenary.nvim",
  },
  config =function ()
    require"kuro.obsidian"
  end,
}
