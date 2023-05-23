-- Github Copilot

-- Official plugin
-- https://docs.github.com/fr/copilot/getting-started-with-github-copilot?tool=neovim
return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    keys = {
      { "<F12>", "<cmd>Copilot panel<CR>", mode = { "n", "i", "v" }, desc = "Display Copilot panel" },
      -- { "<C-a>", "<cmd>copilot#Accept()<CR>", mode = "i", desc = "Accept Copilot solution", { silent = true, expr = true } },
    },
  }

  -- imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
  -- let g:copilot_no_tab_map = v:true

  -- Alternative plugin in pure lua
  -- https://github.com/zbirenbaum/copilot.lua
  -- return {
  --   {
  --     "zbirenbaum/copilot.lua",
  --     config = function()
  --       require("copilot").setup()
  --     end,
  --     cmd = "Copilot",
  --     event = "InsertEnter",
  --   }
  --   ,
  --   -- {
  --   --   "zbirenbaum/copilot-cmp",
  --   --   config = function()
  --   --     require("copilot_cmp").setup()
  --   --   end
  --   -- }
}
