local overrides = require "configs.overrides"
return {
  -- overrides plugins configs
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "configs.null-ls"
        end,
      },
    },
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = overrides.gitsigns,
  },

  {
    "hrsh7th/nvim-cmp",
    event = { "CmdlineEnter", "InsertEnter" },
    opts = overrides.cmp,
    dependencies = {
      {
        "hrsh7th/cmp-cmdline",
        config = function()
          require "configs.cmp-cmdline"
        end,
      },
    },
  },

  --- install plugins
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {}
    end,
    event = "VimEnter",
  },

  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      require "configs.copilot"
    end,
  },

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    cmd = "TodoTelescope",
    event = "BufRead",
    opts = require "configs.todo-comments",
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
  },

  {
    "danymat/neogen",
    lazy = true,
    cmd = "Neogen",
    opts = require "configs.neogen",
    config = function(_, opts)
      require("neogen").setup(opts)
    end,
    requires = "nvim-treesitter/nvim-treesitter",
    -- Uncomment next line if you want to follow only stable versions
    -- tag = "*"
  },

  {
    "enddeadroyal/symbols-outline.nvim",
    branch = "bugfix/symbol-hover-misplacement",
    cmd = "SymbolsOutline",
    event = "BufRead",
    config = function()
      require("symbols-outline").setup()
    end,
  },

  {
    "rmagatti/goto-preview",
    event = "BufRead",
    config = function()
      require("goto-preview").setup { default_mappings = true }
    end,
  },

  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    config = function()
      require("diffview").setup()
    end,
  },
}
