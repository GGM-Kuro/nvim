return{
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {"-","<CMD>Oil <CR>", desc = "Oil Float"},
  },
  config = function ()
    require"kuro.oil"
  end,
}
