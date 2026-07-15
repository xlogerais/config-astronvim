-- INFO:
-- Bllets.vim is a Vim plugin for automated bullet lists.
-- https://github.com/bullets-vim/bullets.vim
-- https://github.com/bullets-vim/bullets.vim/wiki/Configuration
-- https://github.com/bullets-vim/bullets.vim/wiki/Usage

return {
  "bullets-vim/bullets.vim",
  ft = { "markdown", "yaml", "text" },
  init = function()
    vim.g.bullets_enabled_file_types = { "markdown", "yaml", "text" }
    vim.g.bullets_renumber_on_change = 1
  end,
}

-- TODO: Voir aussi l'adaptation lua de ce plugin : https://github.com/kaymmm/bullets.nvim
