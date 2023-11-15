local dap = require("dap")

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = {"-i", "dap"}
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
  },
}

vim.keymap.set("n", '<leader>dc', function() require('dap').continue() end)
vim.keymap.set("n", '<leader>dl', function() require('dap').run_last() end)
vim.keymap.set("n", '<leader>b', function() require('dap').toggle_breakpoint() end)
