local M = {}

function M.config()
  require("mini.pick").setup()
  -- Search
  vim.keymap.set(
    "n",
    "<leader>sb",
    "<cmd>Pick buffers<cr>",
    { desc = "[B]uffers" }
  )
  vim.keymap.set("n", "<leader>sf", "<cmd>Pick files<cr>", { desc = "[F]iles" })
  vim.keymap.set(
    "n",
    "<leader>sk",
    "<cmd>Pick keymaps<cr>",
    { desc = "[K]eymaps" }
  )
  vim.keymap.set(
    "n",
    "<leader>st",
    "<cmd>Pick grep_live<cr>",
    { desc = "[T]ext" }
  )

  -- Code
  vim.keymap.set(
    "n",
    "<leader>cd",
    "<cmd>Pick diagnostic<cr>",
    { desc = "[D]iagnostic" }
  )
end

return M
