local M = {}

function M.setup()
  local opts = {
    draw = {
      animation = require("mini.indentscope").gen_animation.none(),
    },
    symbol = "|",
  }
  require("mini.indentscope").setup(opts)
end

return M
