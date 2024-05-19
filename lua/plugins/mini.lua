return {
  {
    'echasnovski/mini.pairs',
    version = false,
    config = function ()
      require("mini.pairs").setup()
    end
  },

  {
    'echasnovski/mini.ai',
    version = '*',
    config = function ()
      require("mini.ai").setup()
    end
  },

  {
    'echasnovski/mini.comment',
    version = false,
    config = function ()
      require("mini.comment").setup()
    end
  },

  {
    'echasnovski/mini.move',
    version = '*',
    config = function()
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

  {
    'echasnovski/mini.splitjoin',
    version = '*',
    config = function()
      require('mini.splitjoin').setup()
    end
  },

  {
    'echasnovski/mini.surround',
    version = '*',
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = '(a',            -- Add surrounding in Normal and Visual modes
          delete = '(d',         -- Delete surrounding
          find = '(f',           -- Find surrounding (to the right)
          find_left = '(F',      -- Find surrounding (to the left)
          highlight = '(h',      -- Highlight surrounding
          replace = '(r',        -- Replace surrounding
          update_n_lines = '(n', -- Update `n_lines`
        }
      })
    end
  },


}
