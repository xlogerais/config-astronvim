vim.api.nvim_create_autocmd(
  "FileType", {
    pattern = { "python" },
    desc = "Customizations for python files",
    callback = function()
      local utils = require('astrocore')
      utils.notify("Loading autocmd customizations for python files")

      -- Terminal settings

      -- Define prefered options for the terminal
      local name = "python"
      local direction = "vertical"
      local size = 100

      -- Define a new terminal dedicated to python
      local Terminal = require('toggleterm.terminal').Terminal
      local python = Terminal:new({
        name = name,
        size = size,
        direction = direction,
        hidden = true,
        -- close_on_exit = true,
      })

      -- Spawn it in background so it will be ready to execute code
      python:spawn()

      -- Define a function to toggle the terminal
      function _Python_terminal_toggle()
        python:toggle(size, direction)
      end

      -- Define a function to run code from current buffer in the terminal
      function _Python_buffer_exec()
        local command = string.format(" python %s", vim.api.nvim_buf_get_name(0))
        if not python:is_open() then python:open(size, direction) end
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

      utils.notify("Type <F10> to toggle the python terminal")
      utils.notify("Type Ctrl+<F10> to run current buffer in the python terminal")

      -- DevDocs
      require('nvim-devdocs').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
      vim.keymap.set({ 'n', 'i', 'v' }, '<F1>', ':DevdocsOpen python-3.10<CR>', { buffer = true })

      utils.notify("Type <F1> to access DevDocs documentation for python")

      -- Vim settings

      vim.opt_local.signcolumn = "auto"
      vim.opt_local.foldcolumn = "auto"
    end,
  }
)
