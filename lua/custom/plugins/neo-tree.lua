return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        width = 50,
        mappings = {
          ["<space>"] = false, -- disable space until we figure out which-key disabling
          [">"] = "next_source",
          ["<"] = "prev_source",
        },
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function(file_path)
            -- auto close
            -- vimc.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      },
      close_if_last_window = true,
    },
  }
}
