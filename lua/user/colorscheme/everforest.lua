local M = {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("everforest")
  end,
}

function M.setup()
  local opts = {
    background = "dark",
    ui_contrast = "high",
  }
  local everforest = require("everforest")
  everforest.config(opts)
end

return M
