local lsp_attach = require "kuro.lsp.attach"
local lsp_flags = require "kuro.lsp.flags"

return function(ops)
  local config = {
    on_attach = lsp_attach,
    flags = lsp_flags,
  }
  if vim.fn.executable "html-languageserver" == 1 then
    config.cmd = { "html-languageserver", "--stdio" }
  end

  return vim.tbl_extend("force", config, ops)
end
