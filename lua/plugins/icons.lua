return {
  "nvim-mini/mini.icons",
  version = false,
  config = function()
    local m = require("mini.icons")
    m.setup()
    m.mock_nvim_web_devicons()
    m.tweak_lsp_kind()
  end,
}
