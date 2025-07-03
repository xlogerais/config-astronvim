-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE
return {
  "milanglacier/minuet-ai.nvim",
  opts = {
    -- provider = "codestral",
    virtualtext = {
      auto_trigger_ft = { "sh", "lua", "python", "yaml", "json" },
      keymap = {
        -- accept whole completion
        accept = "<A-y>",
        -- accept one line
        accept_line = "<A-l>",
        -- accept n lines (prompts for number)
        -- e.g. "A-z 2 CR" will accept 2 lines
        accept_n_lines = "<A-z>",
        -- Cycle to prev completion item, or manually invoke completion
        prev = "<A-[>",
        -- Cycle to next completion item, or manually invoke completion
        next = "<A-]>",
        -- Dismiss
        dismiss = "<A-c>",
      },
    },
  },
  -- specs = {
  --   "Saghen/blink.cmp",
  --   optional = true,
  --   opts = {
  --     keymap = {
  --       -- Manually invoke minuet completion.
  --       ["<A-y>"] = require("minuet").make_blink_map(),
  --     },
  --     sources = {
  --       -- Enable minuet for autocomplete
  --       default = { "lsp", "path", "buffer", "snippets", "minuet" },
  --       -- For manual completion only, remove 'minuet' from default
  --       providers = {
  --         minuet = {
  --           name = "minuet",
  --           module = "minuet.blink",
  --           async = true,
  --           -- Should match minuet.config.request_timeout * 1000,
  --           -- since minuet.config.request_timeout is in seconds
  --           timeout_ms = 3000,
  --           score_offset = 50, -- Gives minuet higher priority among suggestions
  --         },
  --       },
  --     },
  --     -- Recommended to avoid unnecessary request
  --     completion = { trigger = { prefetch_on_insert = false } },
  --   },
  -- },
  -- specs = {
  --   {
  --     "AstroNvim/astrocore",
  --     opts = {
  --       options = {
  --         g = {
  --           -- set the ai_accept function
  --           ai_accept = function()
  --             if require("minuet.virtualtext").action.is_visible then
  --               vim.api.nvim_input(require("minuet.virtualtext").action.accept_n_lines)
  --               return true
  --             end
  --           end,
  --         },
  --       },
  --     },
  --   },
  -- },
}
