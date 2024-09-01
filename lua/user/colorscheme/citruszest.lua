local M = {
  "zootedb0t/citruszest.nvim",
  lazy = false,
  priority = 1000,
  -- init = function()
  --     vim.cmd.colorscheme("citruszest")
  -- end,
}

function M.config()
  local opts = {
    option = {
      transparent = false,
      bold = true,
      italic = true,
    },
  }

  require("citruszest").setup(opts)
end

return M
