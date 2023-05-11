-- Github Copilot

-- Official plugin
-- https://docs.github.com/fr/copilot/getting-started-with-github-copilot?tool=neovim
-- return {
--   {
--     "github/copilot.vim",
--     config = function()
--       require("_copilot").setup() -- NOT WORKING
--     end,
--     event = "InsertEnter",
--   },
-- }
--


-- Alternative plugin in pure lua
-- https://github.com/zbirenbaum/copilot.lua
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup()
    end,
  }
  ,
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  }
}
