require "config.settings"
require "config.lazy"
require "config.keymaps"



local augroup = vim.api.nvim_create_augroup
local KuroGroup = augroup('Kuro', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
  require("plenary.reload").reload_module(name)
end

vim.api.nvim_create_autocmd('FileType', {
  group = KuroGroup,
  pattern = 'netrw',
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', 'h', '<Left>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 't', '<Down>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'n', '<Up>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 's', '<Right>', { noremap = true, silent = true })
  end,
})


autocmd('TextYankPost', {
  group = yank_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

autocmd({ "BufWritePre" }, {
  group = KuroGroup,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- autocmd({ "BufWritePre" }, {
--   pattern = "*.html",
--   command = 'Neoformat',
-- })

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
