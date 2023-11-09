vim.api.nvim_create_autocmd(
  "FileType", {
    desc = "Customizations for groovy files",
    -- group = vim.api.nvim_create_augroup("groovy", { clear = true }),
    pattern = { "groovy", "Jenkinsfile" },
    callback = function()
      local utils = require("astronvim.utils")
      utils.notify("Loading autocmd customizations for groovy files")

      -- Define a new terminal dedicated to groovy
      local Terminal = require('toggleterm.terminal').Terminal
      local groovy = Terminal:new({
        name = "groovy",
        size = 50,
        direction = "horizontal",
        hidden = true,
        close_on_exit = true,
      })

      -- Spawn in background so it will be ready to execute code
      groovy:spawn()

      -- Define a function to toggle the terminal
      function _groovy_terminal_toggle()
        groovy:toggle(50, 'horizontal')
      end

      -- Define a function to run code from current buffer in the terminal
      function _groovy_buffer_exec()
        local command = string.format(" groovy %s", vim.api.nvim_buf_get_name(0))
        groovy:open(50, 'horizontal')
        groovy:send(' clear', true)
        groovy:send(command, true)
      end

      -- Define a keymap to run the current buffer in the terminal
      --   <F10> corresponds to         F10 on my keyboard
      --   <F22> corresponds to Shift + F10 on my keyboard
      --   <F34> corresponds to Ctrl  + F10 on my keyboard
      vim.api.nvim_set_keymap("n", "<F10>",
        "<cmd>lua _groovy_terminal_toggle()<cr>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("i", "<F10>",
        "<cmd>lua _groovy_terminal_toggle()<cr>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<F10>",
        "<cmd>lua _groovy_terminal_toggle()<cr>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<F34>",
        -- "<cmd>TermExec name=groovy cmd='groovy %'<cr>",
        '<cmd>lua _groovy_buffer_exec()<cr>',
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("i", "<F34>",
        -- "<cmd>TermExec name=groovy cmd='groovy %'<cr>",
        '<cmd>lua _groovy_buffer_exec()<cr>',
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<F34>",
        -- "<cmd>TermExec name=groovy cmd='groovy %'<cr>",
        '<cmd>lua _groovy_buffer_exec()<cr>',
        { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap('n', '<F5>', ':terminal groovysh<CR>', { noremap = true, silent = true })
      --   vim.opt_local.wrap = true
      --   vim.opt_local.spell = true
    end,
    -- command = "setlocal wrap spell",
  }
)
