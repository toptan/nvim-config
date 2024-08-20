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
  local todo = require("todo-comments")
  todo.setup(opts)
  vim.keymap.set(
    "n",
    "<leader>st",
    ":TodoTelescope<cr>",
    { desc = "[S]earch [T]odos" }
  )
end

return M
