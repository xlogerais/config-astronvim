vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Auto switch to insert mode for terminal",
  group = vim.api.nvim_create_augroup("term_auto_insert", { clear = true }),
  pattern = "term://*",
  command = "startinsert",
})
