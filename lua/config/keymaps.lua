vim.keymap.set('n', '<leader>bd', ':bd!<cr>', { desc = "Close current buffer" })

vim.keymap.set({ 'n', 'x' }, '<leader>rr', ':source %<cr>', { desc = "Source the current file" })

vim.keymap.set('v', '<', '<gv', { desc = "after tab out re-select the same" })
vim.keymap.set('v', '>', '>gv', { desc = "after tab in re-select the same" })

vim.keymap.set('n', '.', 'nzzzv', { desc = "NextResult->Middle " })
vim.keymap.set('n', ',', 'Nzzzv', { desc = "PrevResult->Middle " })
vim.keymap.set('n', ';', '.', { desc = "repeat" })

vim.keymap.set('', 't', 'j')
vim.keymap.set('', 'n', 'k')
vim.keymap.set('', 's', 'l')

vim.keymap.set("n", "J", "mzJ`z", { desc = ""})
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half screen up center cursor"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half screen down center cursor"})

vim.keymap.set("n","<leader>bq",'<Esc>:%bdelete|edit #|normal`"<Return>',
  { desc = "Delete other buffers" }
)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
