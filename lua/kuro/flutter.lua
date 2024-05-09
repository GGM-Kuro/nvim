require('flutter-tools').setup({
    lsp = {
        color = {
            -- show the derived colours for dart variables
            enabled = true,         -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = false,     -- highlight the background
            background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
            foreground = false,     -- highlight the foreground
            virtual_text = true,    -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to highlight
        },
        --- OR you can specify a function to deactivate or change or control how the config is created
        capabilities = function(config)
            config.specificThingIDontWant = false
            return config
        end,
        -- see the link below for details on each option:
        -- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
        settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt", -- "always"
            enableSnippets = true,
            updateImportsOnRename = true,      -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
        }
    },

    dev_log = {
        enabled = true,
    },


    closing_tags = {
        highlight = "ErrorMsg", -- highlight for the closing tag
        prefix = ">",           -- character to use for close tag e.g. > Widget
        enabled = true          -- set to false to disable
    },
    widget_guides = {
        enabled = true,
    },
})
