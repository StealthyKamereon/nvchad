return {
  {
    "coffebar/neovim-project",
    opts = {
      projects = {
          "~/Desktop/*",
          "~/AppData/Local/nvim"
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "Shatur/neovim-session-manager" },
    priority = 100,
    lazy = false
  }
}
