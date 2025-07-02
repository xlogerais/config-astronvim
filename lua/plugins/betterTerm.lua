
return {
  {
    -- The improved vscode terminal for Neovim written in pure lua
    "CRAG666/betterTerm.nvim",
    opts = {
      prefix = "betterTerm ",
      position = "bot",
      size = 25,
    },
    keys = {
      {
        mode = { 'n', 't' },
        '<leader>t&',
        function()
          require('betterTerm').open(1)
        end,
        desc = 'Open betterTerm 1',
      },
      {
        mode = { 'n', 't' },
        '<leader>té',
        function()
          require('betterTerm').open(2)
        end,
        desc = 'Open betterTerm 2',
      },
      {
        '<leader>tS',
        function()
          require('betterTerm').select()
        end,
        desc = 'Select a betterTerm terminal',
      }
    },
  },
}
