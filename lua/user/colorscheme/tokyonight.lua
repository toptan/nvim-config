local M = {
  "folke/tokyonight.nvim",
  priority = 1000,
  lazy = false,
  init = function()
    vim.cmd.colorscheme("tokyonight")
  end,
}

function M.setup()
  require("tokyonight").setup()
end

return M
