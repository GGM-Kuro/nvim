SHOULD_RELOAD_TELESCOPE = true

local reloader = function()
    if SHOULD_RELOAD_TELESCOPE then
        RELOAD "plenary"
        RELOAD "telescope"
        RELOAD "alpha.telescope.setup"
    end
end

local fb_actions = require("telescope").extensions.file_browser.actions
local actions = require "telescope.actions"
local my_actions = require "alpha.telescope.actions"
local builtin = require "telescope.builtin"
local telescope_ext = require "telescope".extensions



-- NOTE: Change path if used windows or unix

userPath = vim.fn.expand('$UserProfile/AppData/Local/')


local M = {}

function M.project_files()
    local opts = { show_untracked = true } -- define here if you want to define something
    local ok = pcall(builtin.git_files, opts)
    if not ok then
        builtin.find_files(opts)
    end
end

function M.branches()
    builtin.git_branches {
        attach_mappings = function(_, map)
            map("i", "<c-j>", actions.git_create_branch)
            map("n", "<c-j>", actions.git_create_branch)
            return true
        end,
    }
end

-- NOTE: Dotfiles
-- function M.search_config()
--     builtin.git_files {
--         prompt_title = "< Dotfiles >",
--         cwd = "$HOME/.dotfiles",
--         show_untracked = true,
--     }
-- end

M.find_nvim_config = function()
    builtin.find_files {
        prompt_title = "< Neovim >",
        cwd = string.format('%s%s', userPath, "nvim"),
        -- cwd = "%UserProfile%/AppData/Local/nvim",
    }
end

M.find_nvim_plugin = function()
    builtin.find_files {
        prompt_title = "< Plugins >",
        cwd = string.format('%s%s', userPath, "nvim/lua/plugins"),
        attach_mappings = function(_, map)
            map("i", "<C-t>", my_actions.create_plugin)
            map("i", "<C-d>", my_actions.disable_plugin)
            map("i", "<C-e>", my_actions.enable_plugin)

            return true
        end,
    }
end

function M.grep_string()
    vim.ui.input({ prompt = "Grep for > " }, function(input)
        if input == nil then
            return
        end
        builtin.grep_string { search = input }
    end)
end

function M.grep_word()
    builtin.grep_string { search = vim.fn.expand "<cword>" }
end

function M.find_symbol()
    vim.ui.input({ prompt = "Symbol for > " }, function(input)
        if input == nil then
            return
        end
        builtin.lsp_workspace_symbols { query = input }
    end)
end

function M.my_plugins()
    if vim.fn.isdirectory "~/code/plugins/" == 0 then
        vim.notify("Directory ~/code/plugins does not exists", vim.log.levels.WARN, { title = "Telescope Mappings" })
        return
    end
    builtin.find_files {
        cwd = "~/code/plugins/",
    }
end

function M.worktree()
    return telescope_ext.git_worktree.git_worktrees()
end

function M.worktree_create()
    return telescope_ext.git_worktree.create_git_worktree()
end

function M.commands_history()
    return telescope_ext.commands_history()
end

function M.refactor()
    return telescope_ext.refactoring.refactors()
end

function M.file_browser_relative()
    return M.file_browser { path = "%:p:h" }
end

function M.file_browser(opts)
    opts = opts or {}

    opts = {
        path = opts.path,
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_config = {
            prompt_position = "top",
        },
        attach_mappings = function(_, map)
            map("i", "<c-y>", fb_actions.create_from_prompt)

            return true
        end,
    }

    return telescope_ext.file_browser.file_browser(opts)
end

function M.yank_history()
    return telescope_ext.yank_history.yank_history(require('telescope.themes').get_cursor({ previewer = false }))
end

-- TODO: revisar funcionalidad
--
-- function M.scratchs()
--     builtin.find_files {
--         prompt_title = "Scratchs",
--         no_ignore = true,
--         cwd = "~/.config/nvim/lua/scratchs/",
--         attach_mappings = function(_, map)
--             map("i", "<c-t>", my_actions.create_scratch_file)
--
--             return true
--         end
--     }
-- end
--
-- function M.projectionist()
--     return require("telescope").extensions.projectionist.projectionist()
-- end
--
-- function M.laravel_commands()
--     return require("telescope").extensions.laravel.laravel()
-- end
--
-- function M.api_specs()
--     if vim.fn.isdirectory "./api-specification" == 0 then
--         vim.notify("Directory api-specification does not exists", vim.log.levels.WARN, { title = "Telescope Mappings" })
--         return
--     end
--     builtin.git_files {
--         cwd = "./api-specification",
--         show_untracked = true,
--     }
-- end
--
-- function M.gateway()
--     return require("alpha.php.gateway").graphql_definitions {
--         layout_config = {
--             horizontal = {
--                 preview_width = function(_, cols, _)
--                     return math.floor(cols * 0.7)
--                 end,
--             },
--         },
--     }
-- end


return setmetatable({}, {
    __index = function(_, k)
        reloader()
        if M[k] then
            return M[k]
        else
            return builtin[k]
        end
    end,
})
