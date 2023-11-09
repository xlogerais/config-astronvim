vim.api.nvim_create_autocmd(
  "FileType", {
    pattern = { "python" },
    desc = "Customizations for python files",
    callback = function()
      local utils = require("astronvim.utils")
      utils.notify("Loading autocmd customizations for python files")

      -- Define a new terminal dedicated to python
      local Terminal = require('toggleterm.terminal').Terminal
      local python = Terminal:new({
        name = "python",
        size = 100,
        direction = "vertical",
        hidden = true,
        close_on_exit = true,
      })

      -- Spawn in background so it will be ready to execute code
      python:spawn()

      -- Define a function to toggle the terminal
      function _Python_terminal_toggle()
        python:toggle(100, 'vertical')
      end

      -- Define a function to run code from current buffer in the terminal
      function _Python_buffer_exec()
        local command = string.format(" python %s", vim.api.nvim_buf_get_name(0))
        python:open(100, 'vertical')
        python:send(' clear', true)
        python:send(command, true)
      end

      -- Define a keymap to run the current buffer in the terminal
      --   <F10> corresponds to         F10 on my keyboard
      --   <F22> corresponds to Shift + F10 on my keyboard
      --   <F34> corresponds to Ctrl  + F10 on my keyboard
      vim.api.nvim_set_keymap("n", "<F10>",
        "<cmd>lua _Python_terminal_toggle()<cr>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("i", "<F10>",
        "<cmd>lua _Python_terminal_toggle()<cr>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<F10>",
        "<cmd>lua _Python_terminal_toggle()<cr>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<F34>",
        -- "<cmd>TermExec name=python cmd='python %'<cr>",
        '<cmd>lua _Python_buffer_exec()<cr>',
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("i", "<F34>",
        -- "<cmd>TermExec name=python cmd='python %'<cr>",
        '<cmd>lua _Python_buffer_exec()<cr>',
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<F34>",
        -- "<cmd>TermExec name=python cmd='python %'<cr>",
        '<cmd>lua _Python_buffer_exec()<cr>',
        { noremap = true, silent = true })

      -- Test
      -- local is_available = utils.is_available
      -- if is_available "notify" then
      --   notify("notify is available", "info")
    end,
  }
)
