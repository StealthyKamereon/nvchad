return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- Mason will never work on Nixos
  {
    "williamboman/mason.nvim",
    enabled = false,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      require("nvim-treesitter.configs").setup(
        {
          ensure_installed = {
            "vim",
            "lua",
            "rust"
          },
          auto_install = true,
          highlight = { enable = true },
          indent = { enable = true },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>sa"] = "@parameter.inner"
            },
            swap_previous = {
              ["<leader>sA"] = "@parameter.inner"
            }
          }
        }
      )
    end
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      keys = "etovxqpdygfblzhckisuran",
    },
    lazy = false,
  },
  { "chrisgrieser/nvim-spider", lazy = true },
  -- Add path auto-completion
  {
    "hrsh7th/cmp-path",
    config = function()
      require('cmp').setup {
        sources = {
          { name = 'path' }
        }
      }
    end
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    config = function()
      require('cmp').setup {
        sources = {
          { name = 'nvim_lsp' }
        }
      }
    end
  }
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}

-- config = merge(config, require("plugins.completions"))
-- config = merge(config, require("plugins.motions"))
-- print(vim.inspect(config))
