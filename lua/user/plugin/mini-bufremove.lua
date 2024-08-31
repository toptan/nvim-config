local M = {
  "echasnovski/mini.bufremove",
  version = false,
}

function M.config()
  require("mini.bufremove").setup()
end

return M
