local M = {}

function M.setup()
  require("mini.extra").setup()

  vim.keymap.set("n", "<leader>fe", MiniExtra.pickers.explorer, { desc = "[E]xplorer" })
  vim.keymap.set("n", "<leader>sk", MiniExtra.pickers.keymaps, { desc = "[K]eymaps" })
  vim.keymap.set("n", "<leader>sd", MiniExtra.pickers.diagnostic, { desc = "[D]iagnostics" })
end

return M
