local M = {}

function M.setup()
  require("mini.files").setup()

  vim.keymap.set("n", "<leader>ff", require("mini.files").open, { desc = "[F]iles" })
end

return M
