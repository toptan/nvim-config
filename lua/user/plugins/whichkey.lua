local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local wk = require("which-key")
  wk.setup()
  -- Document existing key chains
  require('which-key').add({
    { '<leader>c', group = '[C]ode' },
    { '<leader>d', group = '[D]ocument' },
    { '<leader>r', group = '[R]ename' },
    { '<leader>s', group = '[S]earch' },
    { '<leader>w', group = '[W]orkspace' },
    { '<leader>t', group = '[T]oggle' },
    { '<leader>g', group = '[G]it' },
    { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
  })
end

return M
