vim.api.nvim_create_autocmd(
  "FileType", {
    desc = "Customizations for groovy files",
    pattern = { "groovy", "Jenkinsfile" },
    callback = function()
      local utils = require("astronvim.utils")
      utils.notify("Loading autocmd customizations for groovy files")

      -- Vim settings

      vim.opt.signcolumn = "auto"
      vim.opt.foldcolumn = "auto"

      -- Terminal settings

      -- Define prefered options for the terminal
      -- local command = string.format(" groovy %s", vim.api.nvim_buf_get_name(0))
      local name = "groovy"
      local command = " groovysh"
      local direction = "horizontal"
      local size = 25

      -- Define a new terminal dedicated to groovy
      local toggleterm = require('toggleterm')
      local Terminal = require('toggleterm.terminal').Terminal
      local groovy = Terminal:new({
        name = name,
        cmd = command,
        direction = direction,
        size = size,
        hidden = true,
        close_on_exit = true,
      })

      -- Spawn in background so it will be ready to execute code
      groovy:spawn()

      -- Add to toggleterm list
      -- groovy:__add() -- TODO: This is not working

      -- Define a function to toggle the terminal
      function _Groovy_terminal_toggle()
        groovy:toggle(size, direction)
      end

      -- -- Define a function to run code from current buffer in the terminal
      -- function _Groovy_buffer_exec()
      -- if not groovy:is_open() then groovy:open(size, direction) end
      --   groovy:open(size, direction)
      --   groovy:send(' clear', true)
      --   groovy:send(command, true)
      -- end

      --
      -- Define a function to run code from visual selection in the terminal
      -- function _Groovy_visual_exec(args)
      --   groovy:open(size, direction)
      --   toggleterm.send_lines_to_terminal("visual_lines", true, { groovy.id })
      -- end

      -- Define a keymap to run the current buffer in the terminal
      --   <F10> corresponds to         F10 on my keyboard
      --   <F22> corresponds to Shift + F10 on my keyboard
      --   <F34> corresponds to Ctrl  + F10 on my keyboard
      vim.api.nvim_set_keymap("n", "<F10>",
        "<cmd>lua _Groovy_terminal_toggle()<cr>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("i", "<F10>",
        "<cmd>lua _Groovy_terminal_toggle()<cr>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<F10>",
        "<cmd>lua _Groovy_terminal_toggle()<cr>",
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("t", "<F10>",
        "<cmd>lua _Groovy_terminal_toggle()<cr>",
        { noremap = true, silent = true })

      -- vim.api.nvim_set_keymap("n", "<F22>",
      --   '<cmd>lua _Groovy_visual_exec()<cr>',
      --   { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("i", "<F22>",
      --   '<cmd>lua _Groovy_visual_exec()<cr>',
      --   { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("v", "<F22>",
      --   "<cmd>lua _Groovy_visual_exec()<cr>",
      --   { noremap = true, silent = true })

      -- vim.api.nvim_set_keymap("n", "<F34>",
      --   '<cmd>lua _Groovy_buffer_exec()<cr>',
      --   { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("i", "<F34>",
      --   '<cmd>lua _Groovy_buffer_exec()<cr>',
      --   { noremap = true, silent = true })
      -- vim.api.nvim_set_keymap("t", "<F34>",
      --   '<cmd>lua _Groovy_buffer_exec()<cr>',
      --   { noremap = true, silent = true })
    end,
  }
)
