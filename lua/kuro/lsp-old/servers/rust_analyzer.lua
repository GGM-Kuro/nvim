local lsp_attach = require "kuro.lsp.attach"
local lsp_flags = require "kuro.lsp.flags"

return function(ops)
  return vim.tbl_extend("force", {
      on_attach = lsp_attach,
      flags = lsp_flags,
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = {
            allFeatures = true,
            overrideCommand = {
              "cargo",
              "clippy",
              "--workspace",
              "--message-format=json",
              "--all-targets",
              "--all-features",
            },
          },
        },
      },
    }, ops)
end
