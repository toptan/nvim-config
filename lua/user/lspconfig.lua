local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neodev.nvim" },
  },
}

function M.config()
  local wk = require "which-key"
  local mappings = {
    { "<leader>l", group = "LSP" },
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
  }
  wk.add(mappings)
end

return M
