local dap = require("dap")

dap.configurations.rust = {
  {
    type = "codelldb",
    request = "launch",
    cwd = "${workspaceFolder}",
    -- program = function()
    --     return vim.fn.input("Path to executable: ", vim.fn.getcwd(".") .. "/", "file")
    -- end,
    -- program = "${fileDirname}/${fileBasenameNoExtension}",
    program = "target/release/estudo",
    terminal = "integrated",
  },
}
