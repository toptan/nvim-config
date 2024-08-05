local M = {
  "nvimdev/lspsaga.nvim",
  lazy = true,
  event = "LspAttach",
}

function M.config()
  require("lspsaga").setup({})
end

return M
