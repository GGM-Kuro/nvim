return {
    'akinsho/flutter-tools.nvim',

    -- 'thosakwe/vim-flutter',
    lazy = false,
    ft = false,
    cmd = 'Flutter',
    opts = {
        ui = {
            border = 'rounded',
        }
    },
    config = function()
        require'kuro.flutter'
    end,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    keys = {
        { "<leader>fx", ":FlutterRun<cr>",         desc = "run" },
        { "<leader>fd", ":FlutterDevices<cr>",     desc = "devices" },
        { "<leader>fe", ":FlutterEmulators<cr>",   desc = "emulators" },
        { "<leader>fq", ":FlutterQuit<cr>",        desc = "quit" },
        { "<leader>fr", ":FlutterReload<cr>",      desc = "hotReload" },
        { "<leader>fR", ":FlutterRestart<cr>",     desc = "hotRestart" },
        { "<leader>fD", ":FlutterVisualDebug<cr>", desc = "debug" }
    },

}
