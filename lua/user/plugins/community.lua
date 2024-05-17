return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.python" },
  --
  -- Personal config
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.markdown" },
  -- { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.helm" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.angular" },

  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },

  { import = "astrocommunity.completion.copilot-lua-cmp" },

  { import = "astrocommunity.diagnostics.trouble-nvim" },

  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  -- { import = "astrocommunity.editing-support.chatgpt-nvim" },

  { import = "astrocommunity.programming-language-support.rest-nvim" },
  -- further customize the options set by the community
  {
    "rest-nvim/rest.nvim",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local utils = require "astronvim.utils"
      if opts.ensure_installed ~= "all" then
        opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed,
          { "lua", "xml", "http", "json", "graphql" })
      end
    end,
  },

  { import = "astrocommunity.project.project-nvim" },

  { import = "astrocommunity.colorscheme.vscode-nvim" },
  { import = "astrocommunity.colorscheme.github-nvim-theme" },
  { import = "astrocommunity.colorscheme.nord-nvim" },
  { import = "astrocommunity.colorscheme.nordic-nvim" },
  { import = "astrocommunity.colorscheme.iceberg-vim" },

}
