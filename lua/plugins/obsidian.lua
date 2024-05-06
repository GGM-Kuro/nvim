return{
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  keys = { "<leader>n"},
  dependencies = {
   "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/Desktop/kuro/Notes"
      },
    }
  },
  config =function ()
    require"kuro.obsidian"
  end,
}
