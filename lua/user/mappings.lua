return {
  -- Normal mode
  n = {
    -- ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

    -- Easy buffer navigation
    ["<tab>"] = { "<cmd>bnext<cr>", desc = "Switch to next buffer" },
    ["<S-tab>"] = { "<cmd>bprevious<cr>", desc = "Switch to previous buffer" },

    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- My telescope keybindings
    ["<leader>gf"] = { "<cmd>Telescope git_files<cr>", desc = "Find git files with Telescope" },
    ["<leader>fq"] = { "<cmd>Telescope quickfix<cr>", desc = "Find quickfixes with Telescope" },
    ["<leader>fs"] = { "<cmd>Telescope spell_suggest<cr>", desc = "Find spell suggestions with Telescope" },
    ["<leader>fp"] = { "<cmd>Telescope projects<cr>", desc = "Find projetcs with Telescope" },

    -- My personal keybindings
    ["<leader>²"] = { name = "Personal" },
    ["<leader>²t"] = { name = "Terminals" },
    ["<leader>²tt"] = { "<cmd>TermSelect<cr>", desc = "Select a terminal" },
    ["<leader>²tg"] = { "<cmd>terminal tig<cr>", desc = "Open tig in a new tab" },

    ["<leader>²n"] = { name = "Neotree" },
    ["<leader>²nb"] = { "<cmd>Neotree toggle buffers left<cr>", desc = "Open Neotree Buffers" },
    ["<leader>²ng"] = { "<cmd>Neotree toggle git_status left<cr>", desc = "Open Neotree Git status" },

    ["<F26>"] = { '<cmd>Neotree toggle<cr>', desc = "File Explorer" },                                     -- F26 corresponds to <Ctrl+F2> on my keyboard
    ["<F27>"] = { function() require("astronvim.utils").toggle_term_cmd "lazygit" end, desc = "Lazygit" }, -- F27 corresponds to <Ctrl+F3> on my keyboard
    ["<F28>"] = { function() require("astronvim.utils").toggle_term_cmd "tig" end, desc = "Tig" },         -- F28 corresponds to <Ctrl+F4> on my keyboard
  },


  -- Insert mode
  i = {
    ["<F26>"] = { '<cmd>Neotree toggle<cr>', desc = "File Explorer" },                                     -- F26 corresponds to <Ctrl+F2> on my keyboard
    ["<F27>"] = { function() require("astronvim.utils").toggle_term_cmd "lazygit" end, desc = "Lazygit" }, -- F27 corresponds to <Ctrl+F3> on my keyboard
    ["<F28>"] = { function() require("astronvim.utils").toggle_term_cmd "tig" end, desc = "Tig" },         -- F28 corresponds to <Ctrl+F4> on my keyboard
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
    ["<F27>"] = { function() require("astronvim.utils").toggle_term_cmd "lazygit" end, desc = "Lazygit" }, -- F27 corresponds to <Ctrl+F3> on my keyboard
    ["<F28>"] = { function() require("astronvim.utils").toggle_term_cmd "tig" end, desc = "Tig" },         -- F28 corresponds to <Ctrl+F4> on my keyboard
  },
}
