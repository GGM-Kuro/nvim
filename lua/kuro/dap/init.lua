local dap, dapui = require "dap", require "dapui"

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/kuro/dap/configs/*.lua", true)) do
  loadfile(ft_path)()
end

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- dap.listeners.after.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.after.event_exited["dapui_config"] = function()
--   dapui.close()
-- end


