local dap = require 'dap'
dap.configurations.c = {
  {
    type = "codelldb",
    request = "launch",
    cwd = "${workspaceFolder}",
    -- program = function()
    --     return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
    -- end,
    -- program = "${fileDirname}/${fileBasenameNoExtension}",
    program = "a.out",
    -- program = "/home/julio/.local/share/nvim/mason/bin/codelldb",
    terminal = "integrated",
  },
}
