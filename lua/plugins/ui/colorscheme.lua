-- vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2 guibg=#aaaaaa gui=nocombine]]
return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     vim.cmd.colorscheme "catppuccin-mocha"
        -- end,
    },
    {
        'nyngwang/nvimgelion',
        config = function()
            -- do whatever you want for further customization~
        end
    },
    {
        'EdenEast/nightfox.nvim',

        config = function()
            vim.cmd.colorscheme "nordfox"
        end,
    }
}
