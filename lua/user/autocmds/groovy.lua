vim.api.nvim_create_autocmd(
  "FileType", {
    desc = "Customizations for groovy files",
    -- group = vim.api.nvim_create_augroup("groovy", { clear = true }),
    pattern = { "groovy", "Jenkinsfile" },
    callback = function()
      local Terminal = require('toggleterm.terminal').Terminal
      local groovysh = Terminal:new({
        name = "groovysh",
        cmd = "groovysh",
        hidden = true,
        close_on_exit = true,
      })

      function _groovysh_toggle()
        groovysh:toggle()
      end

      vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua _groovysh_toggle()<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("i", "<F5>", "<cmd>lua _groovysh_toggle()<CR>", { noremap = true, silent = true })

      -- vim.api.nvim_set_keymap('n', '<F5>', ':terminal groovysh<CR>', { noremap = true, silent = true })
      --   vim.opt_local.wrap = true
      --   vim.opt_local.spell = true
    end,
    -- command = "setlocal wrap spell",
  }
)
