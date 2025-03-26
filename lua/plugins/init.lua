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
  -- Override autopairs to avoid it adding `(` when completing
  {
    'windwp/nvim-autopairs',
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
    end
  },
  {
    "felpafel/inlay-hint.nvim",
    event = "LspAttach",
    config = true
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
          },
          filesystem_watchers = {
            ignore_dirs = {
              "node_modules",
              "target"
            }
          },
          log = {
            enable = true,
            truncate = true,
            types = {
            all = false,
            config = false,
            copy_paste = false,
            dev = false,
            diagnostics = true,
            git = true,
            profile = true,
            watcher = true,
  },
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
