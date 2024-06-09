return{
  'simrat39/symbols-outline.nvim',
  opts = function ()
    require'kuro.symbols-outline'
  end,
  config = function()
    require("symbols-outline").setup()
  end
}
