require('neorg').setup{
  load = {
    ["core.defaults"] = {},
    ["core.concealer"] = {},
    ["core.keybinds"] = {},
    ["core.journal"] = {},
    ["core.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.dirman"] = {
      config = {
        workspaces = {
          notes = "/home/kuro/Desktop/kuro/Notes/",
        },
      },
    },
  }
}
