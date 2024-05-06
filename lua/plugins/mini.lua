return {
  {
    'echasnovski/mini.pairs',
    version = false,
    config = true
  },
  {
    'echasnovski/mini.comment',
    version = false,
    config = true
  },
  {
    'echasnovski/mini.move',
    version = '*',
    config = function ()
      ---@diagnostic disable: undefined-global
      if not LAYOUT then
        require('mini.move').setup {
          mappings = {
            -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
            left = '<S-h>',
            right = '<S-s>',
            down = '<S-t>',
            up = '<S-n>',

            -- Move current line in Normal mode
            line_left = '<S-h>',
            line_right = '<S-s>',
            line_down = '<S-t>',
            line_up = '<S-n>',
          }
        }
      end
    end,
  },
}

