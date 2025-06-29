return {
  "echasnovski/mini.icons",
  version = false,
  config = function()
    local icons = require("mini.icons")
    icons.mock_nvim_web_devicons()
    icons.tweak_lsp_kind()
  end,
}
