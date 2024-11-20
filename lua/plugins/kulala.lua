return { {
  "vhyrro/luarocks.nvim",
  priority = 1000,
  config = true,
  opts = {
    rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
  },
  keys= {
    {";r","<cmd>lua require('kulala').run()<CR>",{desc="run"}},
    {";R","<cmd>lua require('kulala').run_all()<CR>",{desc="run all"}},
    {";s","<cmd>lua require('kulala').close()<CR>",{desc="close"}},
    {";.","<cmd>lua require('kulala').jump_next()<CR>",{desc="jump next"}},
    {";,","<cmd>lua require('kulala').jump_prev()<CR>",{desc="jump prev"}},
    {";f","<cmd>lua require('kulala').search()<CR>",{desc="search requests"}},
    {";y","<cmd>lua require('kulala').copy()<CR>",{desc="copy cURL"}},
    {";i","<cmd>lua require('kulala').inspect()<CR>",{desc="inspect"}},
    {";I","<cmd>lua require('kulala').show_stats()<CR>",{desc="inspect"}}
  },
  ft = "http",
},
{
  'mistweaverco/kulala.nvim',
  opts = {}
}
-- {
--   "rest-nvim/rest.nvim",
--   keys= {
--     {";r",":e $MYVIMRC/lua/kuro/rest/rest.http <CR>",{desc="Postman File"}}
--   },
--   ft = "http",
--   dependencies = { "luarocks.nvim" },
--   config = function()
--       require "kuro.rest"
--   end,
-- }
  }
