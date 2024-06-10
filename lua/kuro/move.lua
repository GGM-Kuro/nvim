local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<S-t>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<S-n>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<S-h>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<S-s>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<S-t>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<S-n>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<S-h>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<S-s>', ':MoveHBlock(1)<CR>', opts)

require('move').setup({})

