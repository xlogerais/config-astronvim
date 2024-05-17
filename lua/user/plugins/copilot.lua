-- Github Copilot official plugin
-- (Voir https://docs.github.com/fr/copilot/getting-started-with-github-copilot?tool=neovim)

-- Actuellement désactivé en faveur de la version communautaire (définie dans plugins/community.lua)
-- return {
--   {
--     "github/copilot.vim",
--     event = "InsertEnter",
--     keys = {
--       { "<F12>", "<cmd>Copilot panel<CR>", mode = { "n", "i", "v" }, desc = "Display Copilot panel" },
--       { "<C-a>", "<cmd>copilot#Accept()<CR>", mode = "i", desc = "Accept Copilot solution", { silent = true, expr = true } },
--     },
--   }
-- }

-- Exemple de configuration des touches
-- imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
-- let g:copilot_no_tab_map = v:true

-- Github Copilot Chat plugin
-- (Voir https://github.com/gptlang/CopilotChat.nvim)
return {
  {
    "gptlang/CopilotChat.nvim",
    lazy = false,
  }
}
