return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    vim.keymap.set("n", "<leader>o", ':Noice dismiss<CR>')
    -- add any options here
  },
  keys = {
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-neotest/nvim-nio",

    {
      "rcarriga/nvim-notify",
      config = function()
        local notify = require "notify"
        -- this for transparency
        notify.setup { background_colour = "#000000" }
        -- this overwrites the vim notify function
        vim.notify = notify.notify
      end,
    } }
}
