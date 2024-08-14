require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")

spec("user.colorschemes.kanagawa")
spec("user.whichkey")

-- spec("user.alpha")
-- spec("user.devicons")
-- spec("user.toggleterm")
-- spec("user.nvimtree")

require("user.lazy")

vim.cmd("colorscheme kanagawa")
