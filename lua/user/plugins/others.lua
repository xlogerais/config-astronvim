return {
  -- direnv
  { "direnv/direnv.vim", lazy = false },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  -- {
  --   "rest-nvim/rest.nvim",
  --   ft = "http",
  --   dependencies = { "luarocks.nvim" },
  --   config = function()
  --     require("rest-nvim").setup()
  --   end,
  -- }
}
