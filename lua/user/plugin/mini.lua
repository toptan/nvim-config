local M = {
  "echasnovski/mini.nvim",
  version = false,
}

function M.config()
  require("user.mini.misc").config()
  require("user.mini.icons").config()
  require("user.mini.notify").config()
  require("user.mini.pairs").config()
  require("user.mini.indentscope").config()
  require("user.mini.bufremove").config()
  require("user.mini.clue").config()
  require("user.mini.statusline").config()
  require("user.mini.completion").config()
  require("user.mini.pick").config()
  require("user.mini.extra").config()
end

return M
