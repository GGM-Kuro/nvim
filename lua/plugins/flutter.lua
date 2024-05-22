return{
        'akinsho/flutter-tools.nvim',
        ft = 'dart',
        config = function()
          require 'kuro.flutter'
        end,
      dependencies = {
        {
          "dart-lang/dart-vim-plugin",
          "RobertBrunhage/dart-tools.nvim",
          config = function()
            require 'dart-tools'
          end
        },
      },
}
