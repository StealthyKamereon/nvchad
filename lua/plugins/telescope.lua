return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    defaults = {
      path_display = {"filename_first", "smart"},
      layout_config = {
        horizontal = { width = 0.95 }
      },
      dynamic_preview_title = true
    }
  }
}
