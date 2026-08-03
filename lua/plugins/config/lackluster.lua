local lackluster = require("lackluster")

local color = lackluster.color

lackluster.setup({
  tweak_syntax = {
    string = color.blue,
    type = color.green,
    keyword_return = color.red,
  }
})

vim.cmd.colorscheme("lackluster-hack")
