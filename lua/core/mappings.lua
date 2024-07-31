local keymap = vim.keymap

-- i
keymap.set("i", "<C-h>", "<Left>", { silent = true, desc = "Move left while editing" })
keymap.set("i", "<C-l>", "<Right>", { silent = true, desc = "Move right while editing" })
keymap.set("i", "<C-k>", "<Up>", { silent = true, desc = "Move up while editing" })
keymap.set("i", "<C-j>", "<Down>", { silent = true, desc = "Move down while editing" })

-- n
keymap.set("n", "<C-h>", "<C-w>h", { silent = true, desc = "Window left" })
keymap.set("n", "<C-l>", "<C-w>l", { silent = true, desc = "Window right" })
keymap.set("n", "<C-k>", "<C-w>k", { silent = true, desc = "Window up" })
keymap.set("n", "<C-j>", "<C-w>j", { silent = true, desc = "Window down" })

keymap.set("n", "<Esc>", ":noh <CR>", { desc = "Clear highlights" })

keymap.set("n", "<C-c>", "<cmd %y+ <CR>", { desc = "Copy whole file" })

keymap.set("n", "<leader>n", "<cmd> set nu! <CR>", { desc = "Toggle line number" })

keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float(0, {scope=\"line\"})<CR>", { desc = "Show full error" })

-- t
keymap.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), { desc = "Escape terminal mode" })
