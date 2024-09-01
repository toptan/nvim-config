local M = {
  "echasnovski/mini.nvim",
  version = false,
}

function M.config()
  require("user.mini.misc").config()
  require("user.mini.icons").config()
  require("user.mini.notify").config()
end

return M
