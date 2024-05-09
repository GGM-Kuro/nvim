local lsp_attach = require "kuro.lsp.attach"
local lsp_flags = require "kuro.lsp.flags"
local dartExcludedFolders = {
  vim.fn.expand('$FLUTTER_HOME')
}

return function(ops)
  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
  return vim.tbl_extend("force", {
      on_attach = lsp_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      cmd = {
					"dart",
					"language-server",
					"--protocol=lsp",
					-- "--port=8123",
					-- "--instrumentation-log-file=/Users/robertbrunhage/Desktop/lsp-log.txt",
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
				}
    }, ops)
end
