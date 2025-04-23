local M = {}

function M.setup()
  local icons = require("mini.icons")
  icons.setup()
  icons.mock_nvim_web_devicons()
  MiniIcons.tweak_lsp_kind()
end

return M
