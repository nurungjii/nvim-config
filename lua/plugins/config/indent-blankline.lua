require("ibl").setup {
  indent = { char = "▏"},
  scope = {
    show_end = false,
  },
  whitespace = {
    remove_blankline_trail = false,
  },
  exclude = {
    filetypes = {
      "help",
      "terminal",
      "lazy",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "mason",
      "nvdash",
      "nvcheatsheet",
      "",
    },
    buftypes = { "terminal" }
  }

}
