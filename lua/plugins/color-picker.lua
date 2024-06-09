return {
  "max397574/colortils.nvim",
  cmd = "Colortils",
  keys = { -- load the plugin only when using it's keybinding:
    { "<C-c>", "<cmd>Colortils<cr>" },
  },
  config = function()
    require('kuro.color-picker')
  end,
}
