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
	{ import = "astrocommunity.pack.chezmoi" },

	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.yaml" },
	{ import = "astrocommunity.pack.toml" },

	{ import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.ruby" },
  -- { import = "astrocommunity.pack.java" },
  -- { import = "astrocommunity.pack.html-css" },
  -- { import = "astrocommunity.pack.angular" },

  -- { import = "astrocommunity.pack.ansible" },
  -- { import = "astrocommunity.pack.terraform" },
  -- { import = "astrocommunity.pack.docker" },
  -- { import = "astrocommunity.pack.helm" },

  -- { import = "astrocommunity.pack.rainbow-delimiter-indent-blankline" },
  { import = "astrocommunity.indent.indent-rainbowline" },

	-- Recipes

	{ import = "astrocommunity.recipes.disable-tabline" },
	{ import = "astrocommunity.recipes.heirline-mode-text-statusline" },
	{ import = "astrocommunity.recipes.heirline-vscode-winbar" },
	{ import = "astrocommunity.recipes.cache-colorscheme" },
	{ import = "astrocommunity.recipes.neo-tree-dark" },
	{ import = "astrocommunity.recipes.neovide" },

	-- Completion
	{ import = "astrocommunity.completion.blink-cmp-git" },
	{ import = "astrocommunity.completion.blink-cmp-emoji" },
	-- { import = "astrocommunity.completion.cmp-spell" },
	-- { import = "astrocommunity.completion.copilot-lua-cmp" },

	-- Telescope
	{ import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" }, -- A Telescope extension to manage Toggleterm's terminals in NeoVim
	-- { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },

	-- Individual plugins (misc)

	-- { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" }, -- display a column when text width exceed defined limit
	{ import = "astrocommunity.diagnostics.trouble-nvim" },
	{ import = "astrocommunity.editing-support.nvim-devdocs" },
	{ import = "astrocommunity.git.diffview-nvim" },
	{ import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
	{ import = "astrocommunity.motion.marks-nvim" }, -- Display marks in the sign column
	{ import = "astrocommunity.workflow.hardtime-nvim" }, -- Display hints to get rid of bad habits
	{ import = "astrocommunity.programming-language-support.kulala-nvim" }, -- A minimal HTTP-client interface for Neovim

	-- { import = "astrocommunity.editing-support.chatgpt-nvim" },
	-- { import = "astrocommunity.programming-language-support.rest-nvim" },
	-- { import = "astrocommunity.project.project-nvim" },

	-- Individual plugins (colorschemes)
	{ import = "astrocommunity.colorscheme.vscode-nvim" },
	{ import = "astrocommunity.colorscheme.github-nvim-theme" },
	{ import = "astrocommunity.colorscheme.neosolarized-nvim" },
	{ import = "astrocommunity.colorscheme.nord-nvim" },
	{ import = "astrocommunity.colorscheme.nordic-nvim" },
	{ import = "astrocommunity.colorscheme.iceberg-vim" },
	{ import = "astrocommunity.colorscheme.tokyodark-nvim" },
	{ import = "astrocommunity.colorscheme.tokyonight-nvim" },
	{ import = "astrocommunity.colorscheme.onedarkpro-nvim" },

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

	-- Now provided by core
	-- { import = "astrocommunity.bars-and-lines.vim-illuminate" }, -- highlight other uses of the word under cursor
	-- { import = "astrocommunity.editing-support.todo-comments-nvim" },
}
