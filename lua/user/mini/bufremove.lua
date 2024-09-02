local M = {}

function M.config()
  require("mini.bufremove").setup()
  vim.keymap.set(
    "n",
    "<leader>bc",
    "<cmd>lua MiniBufremove.delete()<cr>",
    { desc = "[C]lose" }
  )
end

return M
