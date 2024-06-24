require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  vim.keymap.set("n", "<leader>S", "<cmd>AerialNavToggle<CR>"),
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "[{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "]}", "<cmd>AerialNext<CR>", { buffer = bufnr })
 end,
      nav = {
        keymaps = {
          ['s'] = 'actions.right'
        }
      }
})




