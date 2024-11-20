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
     [';'] = {
      name = 'REST',
      r = { name = 'run'},
      R = { name = 'run all'},
      y = { name = 'copy cURL'},
      f = { name = 'search'},
      [','] = { name = 'jump prev'},
      ['.'] = { name = 'jump next'},
      s = { name = 'close'},
      i = { name = 'inspect'},
      I = { name = 'show stats'}
    }
    }
    -- [";o"] = { name = '󰮊 Obsidian' }
)
