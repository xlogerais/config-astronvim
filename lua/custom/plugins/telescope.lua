return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
    "da-moon/telescope-toggleterm.nvim",
  },
  config = function(...)
    require "plugins.configs.telescope"(...)
    local telescope = require "telescope"
    telescope.load_extension "file_browser"
    telescope.load_extension "toggleterm"
  end,
}
