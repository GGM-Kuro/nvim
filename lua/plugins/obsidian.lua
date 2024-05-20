return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  keys = { { ";on", ":ObsidianNew<CR>" , desc = "Create Note" } },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function ()
    require 'kuro.obsidian'
  end
}
