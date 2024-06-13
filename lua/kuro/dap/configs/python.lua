local path,dap_python = vim.fn.glob(vim.fn.stdpath 'data' .. '/mason/'), require 'dap-python'
dap_python.setup(path .. 'packages/debugpy/venv/bin/python')
dap_python.test_runer = 'unittest'





