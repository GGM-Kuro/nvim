return function(client, bufnr)
  -- keymaps for lsp
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = 'Definition' })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = 'Declaration' })
  vim.keymap.set("n", "go", vim.lsp.buf.type_definition, { desc = 'Type Definition' })
  vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = 'References' })
  vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = 'Help' })
  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { desc = 'Workspace Symbol' })
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = ' Diagnostics' })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = ' diagnostic' })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = ' diagnostic' })
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references, { desc = 'View references' })
  vim.keymap.set("n", "<C-S-H>", vim.lsp.buf.signature_help, {})

  vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0, desc = "LSP Help information of symbol under the cursor" })
  vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { buffer = 0, desc = "LSP Rename symbol under cursor" })
  vim.keymap.set("i", "<c-h>", vim.lsp.buf.signature_help, { buffer = 0, desc = "LSP Signature help" })
  vim.keymap.set("n", "<leader>vo", ":LspRestart<cr>", { noremap = true, desc = "LSP Restart Server" })
  vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, { buffer = 0, desc = "LSP Code actions" })

  vim.keymap.set("n", "<leader>vf", function()
    return vim.lsp.buf.format {
      async = true,
      filter = function(cli)
        return cli.name ~= "lua_ls"
      end,
    }
  end, { buffer = 0, desc = "LSP format file" })

  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint(bufnr, true)
  end
end
