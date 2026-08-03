require('nvim-treesitter').install({
  "lua", "vim", "vimdoc", "query", "markdown",
  "markdown_inline", "python", "c", "javascript",
  "cpp", "json", "java", "html", "css", "lua",
  "qmljs"
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { "python", "javascript", "lua", "c", "cpp", "java", "html", "css", "json", "markdown", "qml"},
  callback = function()
    vim.treesitter.start()
  end,
})
