local M = {
  "echasnovski/mini.nvim",
  version = false,
}

function M.config()
  require("user.mini.misc").config()
  require("user.mini.icons").config()
  -- NOTE: mini.notify is initialized by noice
  -- require("user.mini.notify").config()
  require("user.mini.pairs").config()
  require("user.mini.indentscope").config()
  require("user.mini.bufremove").config()
  require("user.mini.clue").config()
  require("user.mini.statusline").config()
  require("user.mini.extra").config()
  require("user.mini.cursorword").config()
  require("user.mini.move").config()
  require("user.mini.starter").config()
  require("user.mini.git").config()
end

return M
