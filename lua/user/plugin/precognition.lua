local M = {
  "tris203/precognition.nvim",
  event = "VeryLazy",
}

function M.config()
  require("precognition").setup()
  require("precognition").hide()
end

return M
