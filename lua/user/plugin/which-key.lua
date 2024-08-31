local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local wk = require("which-key")
  local mappings = {
    -- Groups
    { "<leader>t", desc = "[T]oggle" },
  }

  wk.setup()
  wk.add(mappings, opts)
end

return M
