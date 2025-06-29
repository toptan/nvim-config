local M = {}

function M.setup()
  local opts = {
    view = {
      style = "sign",
      signs = { add = "+", change = "~", delete = "-" },
    },
  }
  require("mini.diff").setup(opts)
end

return M
