require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "svelte" },

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
