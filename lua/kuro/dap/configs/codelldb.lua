local dap = require'dap'

dap.adapters.codelldb = {
  type = 'server',
  host = '127.0.0.1',
  port = 13000,
  executable = {
    command = os.getenv("HOME") .. "/.local/share/nvim/mason/bin/codelldb",
    args = { '--port', '13000' },
  }
}
