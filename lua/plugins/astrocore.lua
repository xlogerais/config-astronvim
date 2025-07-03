-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics = { virtual_text = true, virtual_lines = false }, -- diagnostic settings on startup
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- passed to `vim.filetype.add`
    filetypes = {
      -- see `:h vim.filetype.add` for usage
      extension = {
        foo = "fooscript",
      },
      filename = {
        [".foorc"] = "fooscript",
      },
      pattern = {
        [".*/etc/foo/.*"] = "fooscript",
      },
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        number = true, -- sets vim.opt.number
        relativenumber = true, -- sets vim.opt.relativenumber
        spell = false, -- sets vim.opt.spell
        spelllang = "fr", -- Set spell language to french
        signcolumn = "yes", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },

        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        -- ["<Leader>b"] = { desc = "Buffers" },

        -- setting a mapping to false will disable it
        -- ["<C-S>"] = false,

        -- Normal mode : Custom mappings
        ["<F2>"] = { "<cmd>Neotree toggle<cr>", desc = "File Explorer" }, -- F26 corresponds to <Ctrl+F2> on my keyboard
        ["<F3>"] = {
          function() require("astrocore").toggle_term_cmd { cmd = "lazygit", direction = "float" } end,
          desc = "Lazygit terminal",
        },
        ["<F4>"] = {
          function() require("astrocore").toggle_term_cmd { cmd = "tig", direction = "float" } end,
          desc = "Tig terminal",
        },
      },
      -- Insert mode : Custom mappings
      i = {
        ["<F2>"] = { "<cmd>Neotree toggle<cr>", desc = "File Explorer" }, -- F26 corresponds to <Ctrl+F2> on my keyboard
        ["<F3>"] = {
          function() require("astrocore").toggle_term_cmd { cmd = "lazygit", direction = "float" } end,
          desc = "Lazygit terminal",
        },
        ["<F4>"] = {
          function() require("astrocore").toggle_term_cmd { cmd = "tig", direction = "float" } end,
          desc = "Tig terminal",
        },
      },
      -- INFO:
      -- F26 corresponds to <Ctrl+F2> on my keyboard
      -- F27 corresponds to <Ctrl+F3> on my keyboard
      -- F28 corresponds to <Ctrl+F4> on my keyboard

      -- Terminal mode : Custom mappings
      t = {
        -- Switch to normal mode in terminal mode
        ["<Esc><Esc><Esc>"] = { "<C-\\><C-n>" },
        -- Clear Ctrl+l so that we can use it to clear the terminal
        ["<C-l>"] = false,
        ["<C-h>"] = false,
        -- Clear Ctrl-J and Ctrl-K so that we can use them to navigate the terminal (for lazygit)
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        -- My terms
        ["<F3>"] = {
          function() require("astrocore").toggle_term_cmd { name = "LazyGit", cmd = "lazygit", direction = "float" } end,
          desc = "Lazygit terminal",
        }, -- F27 corresponds to <Ctrl+F3> on my keyboard
        ["<F4>"] = {
          function() require("astrocore").toggle_term_cmd { name = "Tig", cmd = "tig", direction = "float" } end,
          desc = "Tig terminal",
        }, -- F28 corresponds to <Ctrl+F4> on my keyboard
      },
    },
  },
}
