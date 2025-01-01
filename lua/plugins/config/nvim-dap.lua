local dap = require("dap")

dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb",
  name = "lldb"
}

local lldb = {
    name = "Launch lldb",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
}

dap.configurations.c = {
  lldb
}

vim.keymap.set("n", '<leader>dc', function() require('dap').continue() end)
vim.keymap.set("n", '<leader>dl', function() require('dap').run_last() end)
vim.keymap.set("n", '<leader>b', function() require('dap').toggle_breakpoint() end)
