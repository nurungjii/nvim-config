local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    }
  }
})

mason_lspconfig.setup({
  -- list of LSPs
  ensure_installed = {
    "html",
    "cssls",
    "quick_lint_js",
    "intelephense",
    "jedi_language_server",
    "clangd",
    "lua_ls",
    "svelte",
    "tsserver",
  },

  automatic_installation = true,
})
