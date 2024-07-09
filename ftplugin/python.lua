vim.opt.colorcolumn = "80"
vim.keymap.set("n", "<c-f>", ":Neoformat <CR>", {desc = "Format Document", noremap = true})

-- Reiniciar LSP al guardar un archivo Python
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.py",
    callback = function()
        vim.cmd("LspRestart")
        vim.cmd("echo 'Lsp restarted'")
    end,
})

