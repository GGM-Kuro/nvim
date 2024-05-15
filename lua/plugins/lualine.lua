return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      globalstatus = true,
    disabled_filetypes = {
      "dapui_watches", "dapui_breakpoints",
      "dapui_scopes", "dapui_console",
      "dapui_stacks", "dap-repl"
    }
    },
    sections = {
      lualine_c = { { "filename", file_status = true, path = 1, } },
      lualine_x = {
        {
          require("lazy.status").updates,
          cond = require("lazy.status").has_updates,
          color = { fg = "#ff9e64" },
        },
      },
    },
    inactive_winbar = {
      lualine_c = { "filename" },
    },
  },
}
