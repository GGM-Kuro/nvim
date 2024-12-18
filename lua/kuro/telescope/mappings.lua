local map_tele = function(key, f, opts)
    local default = {
        mode = "n",
        options = {},
        buffer = nil,
        desc = nil,
        nowait = nil,
    }
    opts = opts or {}
    opts = vim.tbl_deep_extend("force", default, opts or {})

    local rhs = function()
        R("kuro.telescope")[f](opts.options)
    end

    local map_options = {
        remap = false,
        silent = true,
    }
    if opts.buffer then
        map_options.buffer = opts.buffer
    end
    if opts.desc then
        map_options.desc = "󰭎 " .. opts.desc
    end

    vim.keymap.set(opts.mode, key, rhs, map_options)
end

-- Nvim
map_tele("<leader>ep", "find_nvim_plugin", { desc = "Search Neovim plugins" })
map_tele("<leader>ec", "find_nvim_plugin_config", { desc = "Neovim plugins config" })
map_tele("<leader>en", "find_nvim_config", { desc = "Search in nvim directory" })

-- Find
map_tele("<leader>fw", "grep_word", { desc = "Grep word under cursor" })
map_tele("<leader>fs", "grep_string", { desc = "Grep provided input string" })
map_tele("<leader>fS", "find_symbol", { desc = "symbols" })
map_tele("<leader>fp", "file_browser_picker", { desc = "Project files" })
map_tele("<leader>eb", "buffers", { desc = "Open buffers" })

-- Explorer
map_tele("<leader>ee", "file_browser_relative", { desc = "Current directory" })
map_tele("<leader>er", "find_recent_files", { desc = "Recent files" })

-- Utils
map_tele("<leader>fh", "help_tags", { desc = "Neovim Help" })
map_tele("<leader>ft", "treesitter", { desc = "Treesitter buffer elements" })
map_tele("<leader>fd", "diagnostics", { desc = "Diagnostic of the buffer" })
map_tele("<leader>pf", "project_files", { desc = "Open Project files" })
map_tele("<c-r><c-r>", "commands_history", { mode = "c", desc = "previous comands", nowait = true })

-- Git
map_tele("<leader>gf", "git_files", { desc = "Open Project files" })
map_tele("<leader>gc", "branches", { desc = "Git Branches selector" })
map_tele("<leader>gs", "git_status", { desc = "Git status" })


return map_tele
