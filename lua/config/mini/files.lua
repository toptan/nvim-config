local M = {}

function M.setup()
  require("mini.files").setup()

  vim.keymap.set("n", "<leader>ff", MiniFiles.open, { desc = "[F]iles" })
end

return M
