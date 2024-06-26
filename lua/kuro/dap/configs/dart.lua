local dap = require('dap')

dap.adapters.dart = {
  type = "executable",
  command = "dart",
  env = {
    ['DART_SDK_HOME'] = "/usr/bin/flutter/bin/"
  },
  sourceLanguages = { 'dart' },
  -- This command was introduced upstream in https://github.com/dart-lang/sdk/commit/b68ccc9a
  args = {
    "--enable-asserts",
    "debug_adapter"
  }
}
dap.configurations.dart = {
  {
    require("dap.ext.vscode").load_launchjs(),
    type = "dart",
    request = "launch",
    name = "Launch Dart Program",
    -- The nvim-dap plugin populates this variable with the filename of the current buffer
    program = vim.fn.expand("%:p"), -- You may need to adjust this depending on the Lua API for file paths in your Neovim setup
    -- The nvim-dap plugin populates this variable with the editor's current working directory
    cwd = vim.fn.expand("%:p:h"), -- You may need to adjust this depending on the Lua API for file paths in your Neovim setup
    args = {"--help"}, -- Note for Dart apps this is args, for Flutter apps toolArgs
  }
}
