return { {
  "vhyrro/luarocks.nvim",
  priority = 1000,
  config = true,
  opts = {
    rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
  }
},
{
  "rest-nvim/rest.nvim",
  keys= {{";P",":e $MYVIMRC/lua/kuro/REST.http"}},
  ft = "http",
  dependencies = { "luarocks.nvim" },
  config = function()
      require "kuro.rest"
  end,
} }
