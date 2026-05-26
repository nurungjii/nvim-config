require("nvim-treesitter").setup({
  ensure_installed = { "lua" },

  highlight = {
    enable = true,
  },

  -- additional_vim_regex_highlighting = true,

  indent = { enable = true, disable = { "python" } },

  context_commentstring = {
    enable = true,
    enable_autocmd = false
  },
})
