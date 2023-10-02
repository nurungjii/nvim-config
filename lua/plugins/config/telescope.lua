require("telescope").setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim"
    },
    mappings = {
      n = {["q"] = require("telescope.actions").close },
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    set_env = { ["COLORTERM"] = "truecolor"},
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      theme = "dropdown",
      previewer = false,
      mappings = {
        n = {
          ["<leader>x"] = "delete_buffer",
        }
      }
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  },
}

require('telescope').load_extension('fzf')

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {desc="Find files", })
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", {desc="Find previously opened files", })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", {desc="Find string", })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", {desc="Find string under cursor", })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {desc="Find files in current buffer", })
vim.keymap.set("n", "<leader>cm", "<cmd>Telescope git_commits<cr>", {desc="Find files in git commit", })
