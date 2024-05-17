return {
  lsp = {
    formatting = {
      disabled = {
        "yq",
        "yamllint",
        "yamlls"
      },
    },
  },
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
    require "user.autocmds.text"
    require "user.autocmds.terminal"
    require "user.autocmds.groovy"
    require "user.autocmds.python"

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
  end,
}
