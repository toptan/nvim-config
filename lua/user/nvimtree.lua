local M = {
  "nvim-tree/nvim-tree.lua",
  event = "VeryLazy",
}

function M.config()
  local wk = require "which-key"
  wk.add({
    { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
  })

  require("nvim-tree").setup()
end


return M
