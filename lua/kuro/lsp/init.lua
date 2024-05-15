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

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setqflist)

vim.keymap.set({ "n", "i" }, "<C-b>", function()
  vim.lsp.inlay_hint(0, nil)
end)

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-.>", vim.lsp.buf.code_action, opts)

    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", ";r", vim.lsp.buf.rename, opts)

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

-- lsp_config["dcmls"].setup({
--   capabilities = capabilities,
--   cmd = {
--     "dcm",
--     "start-server",
--     "--clien=neovim"
--   },
--   filetypes = { "dart", "yaml" },
--   root_dir= lsp_config.util.root_pattern("pubspec.yaml"),
--   settings = {
--     dart = {
--       analysisExcludedFolders = dartExcludedFolders,
--     },
--   },
-- })

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

lsp_config.clangd.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities,
})

lsp_config.pyright.setup({
  capabilities = capabilities,
})

lsp_config.astro.setup({
  capabilities = capabilities,
})

lsp_config.tailwindcss.setup({
  capabilities = capabilities,
})

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

-- Hot reload :)
-- require("dart-tools")
