return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
    lazy = false,
    cmd = { "TodoTrouble", "TodoTelescope", "TodoQuickFix" },
    keys = {
        { '<leader>et', ':TodoTelescope<cr>', desc = 'TODO Explorer' },
        {
            "]t",
            function()
                require("todo-comments").jump_next()
            end,
        },
        {
            "[t",
            function()
                require("todo-comments").jump_prev()
            end,
        },
    },
}
