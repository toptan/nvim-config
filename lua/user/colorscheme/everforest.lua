local M = {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000,
}

function M.config()
  local opts = {
    background = "dark",
    ui_contrast = "high",
  }
  require("everforest").setup(opts)
end

return M
