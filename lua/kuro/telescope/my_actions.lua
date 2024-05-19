local M = {}

local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"

M.create_plugin = function(prompt_bufnr)
    local new_plugin = action_state.get_current_line()
    actions.close(prompt_bufnr)
    vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
end


M.create_scratch_file = function(prompt_bufnr)
    local new_scratch = action_state.get_current_line()
    actions.close(prompt_bufnr)
    vim.cmd(string.format("edit ~/.config/nvim/lua/scratchs/%s.lua", new_scratch))
end

return M
