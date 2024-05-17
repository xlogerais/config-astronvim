vim.api.nvim_create_autocmd(
  "FileType", {
    desc = "Customizations for groovy files",
    pattern = { "groovy", "Jenkinsfile" },
    callback = function()
      local utils = require('astrocore')
      utils.notify("Loading autocmd customizations for groovy files")

      -- Terminal settings

      -- Define prefered options for the terminal
      -- local command = string.format(" groovy %s", vim.api.nvim_buf_get_name(0))
      local name = "groovy"
      local command = " groovysh"
      local direction = "horizontal"
      local size = 25
      local toggle_key = "<F10>"

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

      -- -- Define a function to run code from current buffer in the terminal
      -- function _Groovy_buffer_exec()
      --   if not groovy:is_open() then groovy:open(size, direction) end
      --   groovy:send(' clear', true)
      --   groovy:send(command, true)
      -- end

      --
      -- Define a function to run code from visual selection in the terminal
      function _Groovy_visual_exec()
        if not groovy:is_open() then groovy:open(size, direction) end
        toggleterm.send_lines_to_terminal("visual_lines", true, { groovy.id })
      end

      -- Define a keymap to run the current buffer in the terminal
      vim.keymap.set({ 'n', 'i', 'v', 't' }, '<F10>', function() groovy:toggle(size, direction) end,
        { noremap = true, silent = true })
      vim.api.nvim_set_keymap("v", "<F22>", "<cmd>lua _Groovy_visual_exec()<cr>", { noremap = true, silent = true })

      -- Vim settings

      vim.opt_local.signcolumn = 'auto'
      vim.opt_local.foldcolumn = 'auto'
      vim.opt_local.makeprg = 'groovy %'
      vim.keymap.set({ 'n', 'i', 'v' }, '<F5>', ':make<CR>', { buffer = true })

      -- vim.keymap.nnoremap { '<leader>²x', ':make<CR>' }
      -- vim.keymap.inoremap { '<leader>²x', '<ESC>:make<CR>' }

      -- DevDocs
      require('nvim-devdocs').setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
      vim.keymap.set({ 'n', 'i', 'v' }, '<F1>', ':DevdocsOpen groovy-2.4<CR>', { buffer = true })
    end,
  }
)
