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

    -- My personal keybindings
    ["<leader>x"] = { name = "Personal" },

    ["<leader>xn"] = { name = "Neotree" },
    ["<leader>xnb"] = { "<cmd>Neotree toggle buffers left<cr>", desc = "Open Neotree Buffers" },
    ["<leader>xng"] = { "<cmd>Neotree toggle git_status left<cr>", desc = "Open Neotree Git status" },

    ["<leader>xt"] = { "<cmd>terminal tig<cr>", desc = "Open tig in a new tab" },

    -- My telescope keybindings
    ["<leader>fq"] = { "<cmd>Telescope quickfix<cr>", desc = "Find quickfixes with Telescope" },
    ["<leader>fs"] = { "<cmd>Telescope spell_suggest<cr>", desc = "Find spell suggestions with Telescope" },
  },


  -- Insert mode
  i = {},

  -- Terminal mode
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    -- Clear Ctrl+l so that we can use it to clear the terminal
    ["<C-l>"] = false,
    ["<C-h>"] = false,
    -- Clear Ctrl-J and Ctrl-K so that we can use them to navigate the terminal (for lazygit)
    ["<C-j>"] = false,
    ["<C-k>"] = false,
    -- Switch to normal mode in terminal mode
    ["<Esc><Esc><Esc>"] = { "<C-\\><C-n>" }
  },
}
