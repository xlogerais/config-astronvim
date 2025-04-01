-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Custom keymaps

-- use gp to set visual selection on the recently pasted text
vim.keymap.set('n', 'gp', '`[v`]', { desc = 'Visual selection of pasted text' })

-- Needed for python3 through mise
-- Locate python3 using PATH
local python_path = vim.fn.exepath("python3")
if python_path == nil or python_path == "" then
else
  vim.g.python3_host_prog = python_path
end
