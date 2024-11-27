-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder

  --
  -- Personal config
  --

  -- Packs
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },
  -- { import = "astrocommunity.pack.markdown" },
  -- { import = "astrocommunity.pack.ansible" },
  -- { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.helm" },
  -- { import = "astrocommunity.pack.terraform" },
  -- { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.java" },
  -- { import = "astrocommunity.pack.html-css" },
  -- { import = "astrocommunity.pack.angular" },

  -- Individual plugins (misc)
  -- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.nvim-devdocs" },
  -- { import = "astrocommunity.editing-support.chatgpt-nvim" },
  { import = "astrocommunity.indent.indent-rainbowline" },
  { import = "astrocommunity.programming-language-support.rest-nvim" },
  { import = "astrocommunity.project.project-nvim" },

  -- Individual plugins (colorschemes)
  { import = "astrocommunity.colorscheme.vscode-nvim" },
  { import = "astrocommunity.colorscheme.github-nvim-theme" },
  { import = "astrocommunity.colorscheme.onedarkpro-nvim" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.tokyodark-nvim" },
  { import = "astrocommunity.colorscheme.neosolarized-nvim" },
  { import = "astrocommunity.colorscheme.nord-nvim" },
  { import = "astrocommunity.colorscheme.nordic-nvim" },
  { import = "astrocommunity.colorscheme.iceberg-vim" },

  -- Individual plugins customization
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   opts = function(_, opts)
  --     local utils = require "astronvim.utils"
  --     if opts.ensure_installed ~= "all" then
  --       opts.ensure_installed = utils.list_insert_unique(opts.ensure_installed,
  --         { "lua", "xml", "http", "json", "graphql" })
  --     end
  --   end,
  -- },
  --
  -- Now provided by core
  -- { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  -- { import = "astrocommunity.editing-support.todo-comments-nvim" },
}
