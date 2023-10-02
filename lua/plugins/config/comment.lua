require("Comment").setup()

vim.keymap.set("n", "<leader>/", require("Comment.api").toggle.linewise.current, {desc = "Toggle comment"})

vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {desc = "Toggle comment"})
