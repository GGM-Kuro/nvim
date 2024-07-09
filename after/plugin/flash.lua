local wk = require'which-key'

local jump = function()
  require("flash").jump({
    search = { mode = "search", max_length = 0 },
    label = { after = { 0, 0 } },
    pattern = "^"
  })
end



wk.register({
  ['<c-j>'] = {jump,'jump line' },
})
