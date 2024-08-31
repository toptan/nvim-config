local M = {
  "echasnovski/mini.icons",
  version = false,
}

function M.config()
  local mi = require("mini.icons")
  mi.setup()
  mi.mock_nvim_web_devicons()
end

return M
