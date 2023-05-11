return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    -- ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    -- ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    -- ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    -- ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },

    -- Easy buffer navigation
    ["<tab>"] = { "<cmd>bnext<cr>", desc = "Switch to next buffer" },
    ["<S-tab>"] = { "<cmd>bprevious<cr>", desc = "Switch to previous buffer" },
    ["<leader>b>"] = { "<cmd>bprevious<cr>", desc = "Switch to previous buffer" },

    -- My personal keybindings
    ["<leader>xb"] = { "<cmd>Neotree toggle buffers left<cr>", desc = "Open neotree buffers" },
    ["<leader>xt"] = { "<cmd>terminal tig<cr>", desc = "Open tig in a new tab" },
    ["<leader>tt"] = { "<cmd>terminal tig<cr>", desc = "Open tig in a new tab" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
    -- Clear Ctrl+l so that we can use it to clear the terminal
    ["<C-l>"] = false,
    ["<C-h>"] = false,
    -- Switch to normal mode in terminal mode
    ["<Esc><Esc><Esc>"] = { "<C-\\><C-n>" }
  },
}
