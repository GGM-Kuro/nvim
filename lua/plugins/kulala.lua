return { {
  "vhyrro/luarocks.nvim",
  priority = 1000,
  config = true,
  opts = {
    rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
  }
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
