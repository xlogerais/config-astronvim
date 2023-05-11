return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function(...)
    require "plugins.configs.telescope" (...)
    local telescope = require "telescope"
    telescope.load_extension "file_browser"
  end,
}
