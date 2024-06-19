return{
  'tpope/vim-dadbod',
  'kristijanhusak/vim-dadbod-ui',
  'kristijanhusak/vim-dadbod-completion',
  config = function ()
    require('kuro.dadbod').setup()
  end
}
