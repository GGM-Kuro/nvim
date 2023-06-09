return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
        "tpope/vim-dotenv",
    },
    keys = { { "<leader>od", ":tab DBUI<cr>", desc = "Open Database client" } },
    init = function()
        require "alpha.database"
    end,
}
