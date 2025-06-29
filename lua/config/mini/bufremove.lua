local M = {}

function M.setup()
  require("mini.bufremove").setup()
  vim.keymap.set("n", "<leader>x", require("mini.bufremove").delete, { desc = "Delete buffer" })
  vim.keymap.set("n", "<leader>bd", require("mini.bufremove").delete, { desc = "[D]elete buffer" })
end

return M
