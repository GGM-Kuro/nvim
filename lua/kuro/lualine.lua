require 'lualine'.setup {
  options = {
    section_separators = "",
    globalstatus = true,
    disabled_filetypes = {
      "dapui_watches", "dapui_breakpoints",
      "dapui_scopes", "dapui_console",
      "dapui_stacks", "dap-repl"
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { {
      "filename",
      file_status = true,
      symbols = {
        readonly = ' ',
        modified = ' '
      },
      path = 4,
    } },
    lualine_x = {
      "diagnostics",
      {
        "diff",
        symbols = {
          removed = ' ',
          modified = ' ',
          added = ' '
        }
      },
    },
  },
  inactive_winbar = {
    lualine_c = { "filename" },
  },
}



