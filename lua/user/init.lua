return {
  colorscheme = "vscode",
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set key binding
    -- Set autocommands
    -- vim.api.nvim_create_augroup("packer_conf", { clear = true })
    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --   desc = "Sync packer after modifying plugins.lua",
    --   group = "packer_conf",
    --   pattern = "plugins.lua",
    --   command = "source <afile> | PackerSync",
    -- })

    -- Set up custom autocmds
    vim.api.nvim_create_augroup("myterm", { clear = true })
    vim.api.nvim_create_autocmd("TermOpen", {
      desc = "Auto switch to insert mode for terminal",
      group = "myterm",
      pattern = "term://*",
      command = "startinsert",
    })
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
    vim.filetype.add {
      filename = {
        ["Jenkinsfile"] = "groovy",
      },
      extension = {
        Jenkinsfile = "groovy",
      },
    }

    -- Copilot
    -- TODO: find a better way
    vim.g.copilot_no_tab_map = true
    vim.cmd("imap <silent><script><expr> <C-a> copilot#Accept(\"\\<CR>\")")
  end,
}
