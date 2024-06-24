--- @diagnostic disable: undefined-global
if not LAYOUT then
  vim.keymap.set('', 't', 'j')
  vim.keymap.set('', 'n', 'k')
  vim.keymap.set('', 's', 'l')
end

vim.keymap.set('n', '<leader>bd', ':bd!<cr>', { desc = "Close current buffer" })

vim.keymap.set({ 'n', 'x' }, '<leader>r', ':source %<cr>', { desc = "Source the current file" })

vim.keymap.set('v', '<', '<gv', { desc = "after tab out re-select the same" })

vim.keymap.set('v', '>', '>gv', { desc = "after tab in re-select the same" })

vim.keymap.set('n', '.', 'nzzzv', { desc = "NextResult->Middle " })
vim.keymap.set('n', ',', 'Nzzzv', { desc = "PrevResult->Middle " })
vim.keymap.set('n', '>', '.', { desc = "repeat" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half screen up center cursor" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half screen down center cursor" })

vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, { desc = "Code Action" })

vim.keymap.set("n", "<M-a>", "ggVG", { desc = "select all" })

vim.keymap.set("n", "<leader>bq", '<Esc>:%bdelete|edit #|normal`"<Return>',
  { desc = "Delete other buffers" }
)

vim.api.nvim_set_keymap('n', '<leader>t', [[:<C-u>call append(line("."), repeat([""], v:count1))<CR>]],
  { desc = " new line ", silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', [[:<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>]],
  { desc = " new line ", silent = true })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]],{desc='copy to clipboard'})
vim.keymap.set("n", "<leader>Y", [["+Y]],{desc='copy line to clipboard'})

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]],{desc='delete without yank'})

-- This is going to get me cancelle
vim.keymap.set("i", "<C-c>", "<Esc>",{desc = 'cancel'})

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Epic replace' })

vim.keymap.set("n", "<leader>sl", [[:s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Replace in current line' })

vim.keymap.set("n", "<leader>s?", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gcI<Left><Left><Left>]],
  { desc = 'Replace all with confirmation' })

vim.keymap.set("n", "<leader>sf", [[:.,$s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Replace from cursor to end of file' })


vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true,desc='add file-exec permission' })

