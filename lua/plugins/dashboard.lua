return{
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = 'stevearc/oil.nvim',
    opts = function ()
      local dashboard = require 'kuro.dashboard'
      return dashboard
    end,
    config = function(_, dashboard)
        -- close Lazy and re-open when the dashboard is ready
        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "AlphaReady",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        require("alpha").setup(dashboard.opts)

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                dashboard.section.footer.val = "⚡ Neovim loaded " ..
                    stats.count .. " plugins in " .. ms .. "ms\n\t\t\t Good Code Monkey "
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}
