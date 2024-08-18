local M = {
  "folke/todo-comments.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

function M.config()
  local opts = {
    signs = true,
  }
  require("todo-comments").setup(opts)
end

return M
