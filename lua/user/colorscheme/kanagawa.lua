local M = {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  lazy = false,
}

function M.setup() 
  require("kanagawa").setup({})
end

return M
