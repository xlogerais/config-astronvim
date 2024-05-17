-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- vim options can be configured here
    options = {
      opt = {
        -- cmdheight = 1, -- Always show command line
        scrolloff = 0, -- Set scroll offset to zero so that zt and zb work as expected
        -- number = true, -- sets vim.opt.number
        relativenumber = false, -- sets vim.opt.relativenumber
        -- signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        -- foldcolumn = "auto", -- sets vim.opt.foldcolumn to auto
        -- spell = false,         -- sets vim.opt.spell
        spelllang = "fr", -- Set spell language to french
        -- wrap = false,          -- sets vim.opt.wrap
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- Normal mode
      n = {
        -- ["<Leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
        -- ["<Leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
        -- ["<Leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
        -- ["<Leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

        -- Easy buffer navigation
        ["<tab>"] = { "<cmd>bnext<cr>", desc = "Switch to next buffer" },
        ["<S-tab>"] = { "<cmd>bprevious<cr>", desc = "Switch to previous buffer" },

        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        -- My telescope keybindings
        ["<Leader>gf"] = { "<cmd>Telescope git_files<cr>", desc = "Find git files with Telescope" },
        ["<Leader>fq"] = { "<cmd>Telescope quickfix<cr>", desc = "Find quickfixes with Telescope" },
        ["<Leader>fs"] = { "<cmd>Telescope spell_suggest<cr>", desc = "Find spell suggestions with Telescope" },
        ["<Leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "Find projetcs with Telescope" },

        -- My personal keybindings
        ["<Leader>²"] = { name = "Personal" },
        ["<Leader>²t"] = { name = "Terminals" },
        ["<Leader>²tt"] = { "<cmd>TermSelect<cr>", desc = "Select a terminal" },
        ["<Leader>²tg"] = { "<cmd>terminal tig<cr>", desc = "Open tig in a new tab" },

        ["<Leader>²n"] = { name = "Neotree" },
        ["<Leader>²nb"] = { "<cmd>Neotree toggle buffers left<cr>", desc = "Open Neotree Buffers" },
        ["<Leader>²ng"] = { "<cmd>Neotree toggle git_status left<cr>", desc = "Open Neotree Git status" },

        -- ["<F1>"] = { "<cmd>Telescope help_tags<cr>", desc = "Find help with Telescope" },
        ["<F2>"] = { "<cmd>Neotree toggle<cr>", desc = "File Explorer" }, -- F26 corresponds to <Ctrl+F2> on my keyboard
        ["<F3>"] = { function() require("astrocore").toggle_term_cmd "lazygit" end, desc = "Lazygit terminal" }, -- F27 corresponds to <Ctrl+F3> on my keyboard
        ["<F4>"] = { function() require("astrocore").toggle_term_cmd "tig" end, desc = "Tig terminal" }, -- F28 corresponds to <Ctrl+F4> on my keyboard
      },

      -- Insert mode
      i = {
        ["<F2>"] = { "<cmd>Neotree toggle<cr>", desc = "File Explorer" }, -- F26 corresponds to <Ctrl+F2> on my keyboard
        ["<F3>"] = { function() require("astrocore").toggle_term_cmd "lazygit" end, desc = "Lazygit terminal" }, -- F27 corresponds to <Ctrl+F3> on my keyboard
        ["<F4>"] = { function() require("astrocore").toggle_term_cmd "tig" end, desc = "Tig terminal" }, -- F28 corresponds to <Ctrl+F4> on my keyboard
      },

      -- Terminal mode
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
        -- Switch to normal mode in terminal mode
        ["<Esc><Esc><Esc>"] = { "<C-\\><C-n>" },
        -- Clear Ctrl+l so that we can use it to clear the terminal
        ["<C-l>"] = false,
        ["<C-h>"] = false,
        -- Clear Ctrl-J and Ctrl-K so that we can use them to navigate the terminal (for lazygit)
        ["<C-j>"] = false,
        ["<C-k>"] = false,
        -- My terms
        ["<F3>"] = { function() require("astrocore").toggle_term_cmd "lazygit" end, desc = "Lazygit terminal" }, -- F27 corresponds to <Ctrl+F3> on my keyboard
        ["<F4>"] = { function() require("astrocore").toggle_term_cmd "tig" end, desc = "Tig terminal" }, -- F28 corresponds to <Ctrl+F4> on my keyboard
      },
    },
  },
}
