return {
  enabled = true,
  "nvim-lualine/lualine.nvim",
  dependencies= { "nvim-tree/nvim-web-devicons" },
  config = function ()
   require'kuro.lualine'
  end
}
