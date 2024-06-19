return {
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      {
        "mfussenegger/nvim-dap",
        config = function()
          require 'kuro.dap'
        end

      },
    }
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter"
    },
    config =function ()

        local path = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/')
        require('neotest').setup({
          adapters = {
          require('neotest-python')({
            -- dap = { justMiCode = false},
            python = {path .. '/packages/debugpy/venv/bin/python'},
            runner = 'unittest',
          })
          }
        })
    end
  },
  {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
  }
}
