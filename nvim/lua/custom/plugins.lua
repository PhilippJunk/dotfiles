local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {
  {
    "dense-analysis/ale",
    ft  = {"latex", "tex"},
  },

  {
    "mhartington/formatter.nvim",
    cmd = "Format",
    init = function()
      require("core.utils").load_mappings "formatter"
    end,
    ft = {"python", "rust"},
    config = function(_)
      require("formatter").setup{
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
          python = {
            require("formatter.filetypes.python").black,
          },
          rust = {
            require("formatter.filetypes.rust").rustfmt,
          }
        }
      }
    end
  },

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

}

return plugins
