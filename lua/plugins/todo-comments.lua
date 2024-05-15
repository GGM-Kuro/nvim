return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = true,
    lazy = false,
    cmd = { "TodoTrouble", "TodoTelescope", "TodoQuickFix" },
    keys = {
        { '<leader>t', ':TodoTelescope<cr>', desc = 'TODO Explorer' },
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
-- TODO: test
