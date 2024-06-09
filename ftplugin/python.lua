vim.opt.colorcolumn = "80"
vim.keymap.set("n", ";f", ":lua require('conform').format() <CR>", {desc = "Format Document", noremap = true})
