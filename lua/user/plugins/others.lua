return {
  -- direnv
  { "direnv/direnv.vim",       lazy = false },

  -- Search and replace
  {
    "nvim-pack/nvim-spectre",
    cmd = { "Spectre", "SpectreReload" },
  },

  -- REST client
  { "diepm/vim-rest-console",  event = "User AstroFile" },

}
