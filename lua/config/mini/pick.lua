local M = {}

function M.setup()
  local MiniPick = require("mini.pick")
  MiniPick.setup()
  vim.ui.select = MiniPick.ui_select

  vim.keymap.set("n", "<leader>sf", MiniPick.builtin.files, { desc = "[F]iles" })
  vim.keymap.set("n", "<leader>st", MiniPick.builtin.grep_live, { desc = "[T]ext" })
  vim.keymap.set("n", "<leader>sb", MiniPick.builtin.buffers, { desc = "[B]uffers" })
  vim.keymap.set("n", "<leader>sh", MiniPick.builtin.help, { desc = "[H]elp" })
end

return M
