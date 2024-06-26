return {
  {
    "wuelnerdotexe/vim-enfocado",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    --    config = function()
    --      -- load the colorscheme here
    --      vim.cmd([[colorscheme enfocado]])
    --    end,
  },
  {
    'oxfist/night-owl.nvim'
  },
  {
    'EdenEast/nightfox.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme "nightfox"
    end,
    dependencies = {
      'tribela/vim-transparent'
    }
  }
}
