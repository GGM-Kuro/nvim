local wk = require 'which-key'

wk.register({
  ['<c-x>'] = {
    name = "Dap",
    d = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle" },
    r = { "<cmd>lua require('dap').continue()<cr>", "Run" },
    b = { "<cmd> DapToggleBreakpoint <cr>", "Breackpoint" },
    n = { "<cmd> DapStepOver <cr>", "Step Over" },
    t = { "<cmd> DapStepInto <cr>", "Step Into" },
    l = { "<cmd> DapShowLog <cr>", "Log" },
    T = { "<cmd> DapTerminate <cr>", "Termitate" },
    c = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
    C = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap' })<cr>", "Test Class DAP" },
    m = { "<cmd>lua require('neotest').run.run()<cr>", "Test Method" },
    M = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
  }
})


