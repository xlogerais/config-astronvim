-- set vim options here (vim.<first_key>.<second_key> = value)
return {
  opt = {
    cmdheight = 1,

    scrolloff = 0,          -- Set scroll offset to zero so that zt and zb work as expected

    number = true,          -- sets vim.opt.number
    relativenumber = false, -- sets vim.opt.relativenumber

    signcolumn = "auto",    -- sets vim.opt.signcolumn to auto
    foldcolumn = "auto",    -- sets vim.opt.foldcolumn to auto

    spelllang = "fr",       -- Set spell language to french
    -- spell = false,         -- sets vim.opt.spell

    -- wrap = false,          -- sets vim.opt.wrap
  },

  g = {
    -- mapleader = " ",                 -- sets vim.g.mapleader
    -- autoformat_enabled = true,       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
    -- cmp_enabled = true,              -- enable completion at start
    -- autopairs_enabled = true,        -- enable autopairs at start
    -- diagnostics_mode = 3,            -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
    -- icons_enabled = true,            -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
    -- ui_notifications_enabled = true, -- disable notifications when toggling UI elements
  },

}
-- If you need more control, you can use the function()...end notation
-- return function(local_vim)
--   local_vim.opt.relativenumber = true
--   local_vim.g.mapleader = " "
--   local_vim.opt.whichwrap = vim.opt.whichwrap - { 'b', 's' } -- removing option from list
--   local_vim.opt.shortmess = vim.opt.shortmess + { I = true } -- add to option list
--
--   return local_vim
-- end
