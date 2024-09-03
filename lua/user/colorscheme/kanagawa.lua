local M = {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  lazy = false,
}

function M.config()
  require("kanagawa").setup()
end

return M
