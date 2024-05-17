-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom autocmds
require("custom.autocmds")

-- Set up custom filetypes
require("custom.filetypes")

--- Remove some mappings in terminal mode
--- that should have been set by other plugins
--- but that are very annoying
vim.keymap.del("t", "<C-l>") -- INFO: Clear the terminal
vim.keymap.del("t", "<C-j>") -- INFO: Move a commit up/down in LazyGit
vim.keymap.del("t", "<C-k>") -- INFO: Move a commit up/down in LazyGit
--- NOTE: : Maybe related to the smart-splits plugin
