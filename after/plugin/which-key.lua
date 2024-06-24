local wk = require('which-key')
wk.register(
  {
    ['<leader>']={

       e = { name = '󰭎 Exlpore' },
       f = { name = '󰭎 Find' },
       p = { name = '󰭎 Project' },
       n = { name = ' Notes' },
       s = { name = '󰛔 Epic replace' },
       b = { name = ' Buffer' },
       h = { name = '󰛢 Harpoon' },
       g = { name = ' Git' },
       u = { name = '󰙅 UndoTree' },
    },
    [";f"] = { name = '󰀴 Flutter' },
    [";o"] = { name = '󰮊 Obsidian' }
  }
)
