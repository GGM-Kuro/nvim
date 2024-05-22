return{
  'stevearc/oil.nvim',
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = true,
  keys = {
    {"-","<CMD>Oil <CR>", desc = "Oil Float"},
    {"_","<CMD>echo $PWD | Oil<CR>", desc = "Oil Float"},
  },
}
