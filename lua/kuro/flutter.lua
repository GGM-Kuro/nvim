require('flutter-tools').setup({})
require('flutter-tools').setup({
  lsp = {
    color = {
      -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = true, -- highlight the background
      background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "󰌁", -- the virtual text character to highlight
    },
    capabilities = function(config)
      config.specificThingIDontWant = false
      return config
    end,
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      renameFilesWithClasses = "prompt", -- "always"
      enableSnippets = true,
      updateImportsOnRename = true,      -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
    }
  },
  debugger = {           -- integrate with nvim dap + install dart code debugger
    enabled = false,
    run_via_dap = false, -- use dap instead of a plenary job to run flutter apps
    -- if empty dap will not stop on any exceptions, otherwise it will stop on those specified
    -- see |:help dap.set_exception_breakpoints()| for more info
    exception_breakpoints = {}
  },
  dev_log = {
    enabled = true,
  },
  closing_tags = {
    highlight = "ErrorMsg", -- highlight for the closing tag
    prefix = " ", -- character to use for close tag e.g. > Widget
    enabled = true -- set to false to disable
  },
  widget_guides = {
    enabled = true,
  },
})

-- Hot reload :)
require("dart-tools")
