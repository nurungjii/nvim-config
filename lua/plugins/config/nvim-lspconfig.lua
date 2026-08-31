local cmp_nvim_lsp = require("cmp_nvim_lsp")

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    local opts = { buffer = ev.buf, remap = false, silent = true }
    local keymap = vim.keymap

    opts.desc = "Show LSP references"
    keymap.set("n", "<leader>gR", "<cmd>Telescope lsp_references<CR>", opts)

    opts.desc = "Go to declaration"
    keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, opts)

    opts.desc = "Show LSP definitions"
    keymap.set("n", "<leader>gd", "<cmd>Telescope lsp_definitions<CR>", opts)

    opts.desc = "Show LSP implementations"
    keymap.set("n", "<leader>gi", "<cmd>Telescope lsp_implementations<CR>", opts)

    opts.desc = "Show LSP type definitions"
    keymap.set("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

    opts.desc = "Show buffer diagnostics"
    keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>e", function()
      vim.diagnostic.open_float({ scope = "line" })
    end, opts)

    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", function()
      vim.diagnostic.jump({ count = -1, float = true })
    end, opts)

    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", function()
      vim.diagnostic.jump({ count = 1, float = true })
    end, opts)

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
  end,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN]  = " ",
      [vim.diagnostic.severity.HINT]  = "󰠠 ",
      [vim.diagnostic.severity.INFO]  = " ",
    },
  },
})

local default_capabilities = cmp_nvim_lsp.default_capabilities()

-- Helper function to configure and enable a server
local function setup_server(server_name, config)
  config = config or {}
  config.capabilities = vim.tbl_deep_extend(
    "force",
    default_capabilities,
    config.capabilities or {}
  )

  vim.lsp.config(server_name, config)
  vim.lsp.enable(server_name)
end

local servers = {
  html = {
    root_markers = { "setup.txt" },
  },
  cssls = {},
  quick_lint_js = {},
  qmlls = {
    root_markers = { ".git", "shell.qml" },
    filetypes = { "qml", "qmljs" },
  },
  intelephense = {
    root_markers = { "setup.txt" },
  },
  pyright = {},
  clangd = {},
  svelte = {},
  hls = {
    filetypes = { "haskell", "lhaskell", "cabal" },
  },
  ts_ls = {},
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.stdpath("config") .. "/lua",
          },
        },
      },
    },
  },
}

for server_name, config in pairs(servers) do
  setup_server(server_name, config)
end
