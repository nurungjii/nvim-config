local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
local default_plugin = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- dependencies = { { "nvim-treesitter/nvim-treesitter-context", config = true }, "RRethy/nvim-treesitter-textsubjects" },
    config = function()
      require("plugins.config.treesitter")
      require('nvim-treesitter.install').compilers = { 'gcc' }
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require('plugins.config.nvim-tree')
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      require('plugins.config.indent-blankline')
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    ft = { "gitcommit", "diff" },
    init = function()
      -- Only load gitsigns if files in a git repository is open
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
        callback = function()
          vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
            vim.schedule(function()
              require("lazy").load { plugins = { "gitsigns.nvim" } }
            end)
          end
        end,
      })
    end,
    config = function()
      require('plugins.config.gitsigns')
    end
  },

  {
    "tpope/vim-fugitive",
    ft = { "gitcommit", "diff" },
    init = function()
      -- Only load gitsigns if files in a git repository is open
      vim.api.nvim_create_autocmd({ "BufRead" }, {
        group = vim.api.nvim_create_augroup("GitFugitiveLazyLoad", { clear = true }),
        callback = function()
          vim.fn.system("git -C " .. '"' .. vim.fn.expand "%:p:h" .. '"' .. " rev-parse")
          if vim.v.shell_error == 0 then
            vim.api.nvim_del_augroup_by_name "GitFugitiveLazyLoad"
            vim.schedule(function()
              require("lazy").load { plugins = { "vim-fugitive" } }
            end)
          end
        end,
      })
    end,
    config = function()
      require('plugins.config.vim-fugitive')
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim', { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, "nvim-tree/nvim-web-devicons" },
    config = function()
      require('plugins.config.telescope')
    end
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  -- LSP CCONFIGURATIONS
  {
    "hrsh7th/nvim-cmp",
    event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-buffer",           --source for text in buffer
      "hrsh7th/cmp-path",             -- source for file system paths
      "L3MON4D3/LuaSnip",             -- snippet engine
      "saadparwaiz1/cmp_luasnip",     -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("plugins.config.cmp")
    end
  },

  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      require("plugins.config.mason")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      require("plugins.config.nvim-lspconfig")
    end,
  },

  {
    "Vimjas/vim-python-pep8-indent",
  },
  -- end of LSP

  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("plugins.config.nvim-autopairs")
    end
  },

  {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "gcc", mode = "n",          desc = "Comment toggle current line" },
      { "gc",  mode = { "n", "o" }, desc = "Comment toggle linewise" },
      { "gc",  mode = "x",          desc = "Comment toggle linewise (visual)" },
      { "gbc", mode = "n",          desc = "Comment toggle current block" },
      { "gb",  mode = { "n", "o" }, desc = "Comment toggle blockwise" },
      { "gb",  mode = "x",          desc = "Comment toggle blockwise (visual)" },
    },
    config = function()
      require("plugins.config.comment")
    end
  },

  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.config.neogen")
    end
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("plugins.config.lualine")
    end
  },

  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    config = function()
      require("plugins.config.nvim-dap")
    end
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    event = "VeryLazy",
    config = function()
      require("plugins.config.nvim-dap-ui")
    end
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
      require("plugins.config.lsp_signature")
    end
  },

  {
    "startup-nvim/startup.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.config.startup-nvim")
    end
  },

  {
    "neovimhaskell/haskell-vim",
    config = function()
      --vimscript for vim-haskell
      vim.cmd("let g:haskell_indent_where = 6")
    end
  },

  { 'wakatime/vim-wakatime', lazy = false },

  -- colorscheme
  {
    "nyoom-engineering/oxocarbon.nvim",
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      vim.cmd([[colorscheme oxocarbon]])
    end,
  },

}

local lazy_opts = {
  ui = {
    border = "rounded",
    title = "Plugin Manager",
    title_pos = "center",
  },
}

require("lazy").setup(default_plugin, lazy_opts)
