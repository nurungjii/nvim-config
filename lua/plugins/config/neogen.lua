require("neogen").setup {
  snippet_engine = "luasnip",
  enabled = true,
  languages = {
    ['svelte'] = require('neogen.configurations.javascript')
  }
}

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
