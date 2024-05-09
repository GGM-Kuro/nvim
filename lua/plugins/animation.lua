return {
  "anuvyklack/animation.nvim",
  dependencies = {
    "anuvyklack/middleclass",
  },
  keys = {
    {"<leader>ka", function ()
      require("kuro.animation").redraw_buffer()
    end}
  },
}
