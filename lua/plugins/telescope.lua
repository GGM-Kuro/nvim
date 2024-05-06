return {
  "nvim-telescope/telescope.nvim",
  event = 'VeryLazy',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    } },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    }
  },
  config = function(opts)
    require('telescope').setup(opts)
    require('telescope').load_extension 'ui-select'
    require('telescope').load_extension('fzf')
    require"kuro.telescope.setup"
    require"kuro.telescope.mappings"
  end,
  -- keys = {
  --   {
  --     "<leader>pp",
  --     function()
  --       require('telescope.builtin').git_files({ show_untracked = true })
  --     end,
  --     desc = "󰭎  Files",
  --   },
  --   {
  --     "<leader>eb",
  --     function()
  --       require("telescope.builtin").buffers()
  --     end,
  --     desc = "󰭎 buffers",
  --   },
  --   {
  --     "<leader>gs",
  --     function()
  --       require("telescope.builtin").git_status()
  --     end,
  --     desc = "󰭎  status",
  --   },
  --   {
  --     "<leader>gc",
  --     function()
  --       require("telescope.builtin").git_bcommits()
  --     end,
  --     desc = "󰭎  Commits",
  --   },
  --   {
  --     "<leader>gb",
  --     function()
  --       require("telescope.builtin").git_branches()
  --     end,
  --     desc = "󰭎  branches",
  --   },
  --   { "<leader>ec",
  --     function ()
  --      require("telescope.builtin").find_files({
  --         prompt_title = "Config",
  --         cwd =  "$HOME/.config/nvim/lua/config/"
  --       })
  --     end,
  --     desc = " config"
  --   },
  --   {
  --     "<leader>ep",
  --     function()
  --       require("telescope.builtin").find_files({
  --         prompt_title = "Plugins",
  --         cwd = "$HOME/.config/nvim/lua/plugins/",
  --         attach_mappings = function(_, map)
  --           local actions = require("telescope.actions")
  --           local action_state = require("telescope.actions.state")
  --           map("i", "<c-y>", function(prompt_bufnr)
  --             local new_plugin = action_state.get_current_line()
  --             actions.close(prompt_bufnr)
  --             vim.cmd(string.format("edit $HOME/.config/nvim/lua/plugins/%s.lua", new_plugin))
  --           end)
  --           return true
  --         end
  --       })
  --     end,
  --     desc = " plugins"
  --   },
  --   {
  --     "<leader>eP",
  --     function()
  --       require("telescope.builtin").find_files({
  --         prompt_title = "Plugins",
  --         cwd = "$HOME/.config/nvim/lua/kuro/",
  --         attach_mappings = function(_, map)
  --           local actions = require("telescope.actions")
  --           local action_state = require("telescope.actions.state")
  --           map("i", "<c-y>", function(prompt_bufnr)
  --             local new_plugin = action_state.get_current_line()
  --             actions.close(prompt_bufnr)
  --             vim.cmd(string.format("edit HOME/.config/nvim/lua/kuro/%s.lua", new_plugin))
  --           end)
  --           return true
  --         end
  --       })
  --     end,
  --     desc = " plugins config"
  --   },
  --   {
  --     "<leader>ea",
  --     function()
  --       require('telescope.builtin').find_files()
  --     end,
  --     desc = "󰭎 Find Files",
  --   },
  --   {
  --     "<leader>eh",
  --     function()
  --       require("telescope.builtin").help_tags()
  --     end,
  --     desc = "󰭎 Help"
  --   },
  --   {
  --     "<leader>ee",
  --     function()
  --       require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
  --     end,
  --     desc = "󰭎 File browser"
  --   }
  -- },
}
