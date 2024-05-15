local dap = require('dap')

dap.adapters.codelldb = {
  type = 'executable',
  command = '/usr/bin/lldb-vscode',
  name = 'codelldb'
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to ecutable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = { "--port", "13000"},
  }
}
