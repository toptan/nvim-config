local M = {
  "ellisonleao/gruvbox.nvim",
  lazy = false,
  priority = 1000,
}

function M.config() 
  local cfg = {
    contrast = "hard",
  }
  require("gruvbox").setup(cfg)
end

return M
