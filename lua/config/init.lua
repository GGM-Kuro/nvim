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

vim.api.nvim_exec([[
  autocmd Filetype netrw nnoremap <buffer> h <Left>
  autocmd Filetype netrw nnoremap <buffer> t <Down>
  autocmd Filetype netrw nnoremap <buffer> n <Up>
  autocmd Filetype netrw nnoremap <buffer> s <Right>
  ]],false)


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
