local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
}

function M.config()
  local wk = require("which-key")
  local mappings = {
    -- Groups
    { "<leader>t", desc = "[T]oggle" },
    { "<leader>s", desc = "[S]earch" },
  }

  wk.setup()
  wk.add(mappings, opts)
end

return M
