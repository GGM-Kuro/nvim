local lsp_config = require("lspconfig")
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    -- -- dart sdk ships with LSP
    -- "astro",
    -- "tailwindcss",
    -- "clangd",
    -- "tsserver",
    -- "lua_ls",
  },
})


local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })


vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" }, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, opts)

    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" }, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Lsp Rename" }, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, opts)
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
})

local dartExcludedFolders = {
  vim.fn.expand("$FLUTTER_HOME/"),
  vim.fn.expand("$HOME/.pub-cache"),
}

lsp_config["dartls"].setup({
  capabilities = capabilities,
  cmd = {
    "dart",
    "run",
    "--enable-analytics",
    "language-server",
    "--protocol=lsp",
  },
  filetypes = { "dart" },
  init_options = {
    onlyAnalyzeProjectsWithOpenFiles = false,
    suggestFromUnimportedLibraries = true,
    closingLabels = true,
    outline = false,
    flutterOutline = false,
  },
  settings = {
    dart = {
      analysisExcludedFolders = dartExcludedFolders,
      updateImportsOnRename = true,
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
})

lsp_config.html.setup{
  capabilities = capabilities,
  filetypes = { "html", "htmldjango" },
}

lsp_config.htmx.setup({
  capabilities = capabilities,
  filetypes = { "html", "htmldjango" },
})

lsp_config.clangd.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})

local servers = {
  "pyright",
  "ruff_lsp",
}

for _, lsp in ipairs(servers) do
  lsp_config[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
  })
end

lsp_config.jinja_lsp.setup({
  capabilities = capabilities,
  filetypes = { "html", "htmldjango" },
})

lsp_config.astro.setup({
  capabilities = capabilities,
})

lsp_config.tailwindcss.setup({
  capabilities = capabilities,
  filetypes = { "astro", "html", "htmldjango", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },

})
lsp_config.marksman.setup({})
lsp_config.tsserver.setup({
  capabilities = capabilities,
})

lsp_config.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Tooltip for the lsp in bottom right
require("fidget").setup({})
