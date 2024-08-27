local M = {
  "folke/tokyonight.nvim",
  priority = 1000,
  lazy = false,
}

function M.setup()
  require("tokyonight").setup()
end

return M
