require("Comment").setup({
  pre_hook = function(ctx)
    -- 1. Try to get the comment string via Tree-sitter context safely
    local status_ok, ts_context = pcall(require, 'ts_context_commentstring.internal')
    if status_ok and ts_context then
      local ts_string = ts_context.calculate_commentstring(ctx)
      if ts_string and ts_string ~= "" then
        return ts_string
      end
    end

    -- 2. Fallback: If Tree-sitter isn't available, check Neovim's native commentstring
    local native_cs = vim.bo.commentstring
    if native_cs and native_cs ~= "" then
      return nil -- Returning nil tells Comment.nvim to use the native fallback
    end

    -- 3. Hard Fallback: If absolutely nothing is defined, default to double slash
    local U = require('Comment.utils')
    if ctx.ctype == U.ctype.linewise then
      return '// %s'
    else
      return '/* %s */'
    end
  end,
})

vim.keymap.set("n", "<leader>/", require("Comment.api").toggle.linewise.current, {desc = "Toggle comment"})

vim.keymap.set("v", "<leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", {desc = "Toggle comment"})
