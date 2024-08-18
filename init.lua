require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")

spec("user.colorscheme.tokyonight")
spec("user.colorscheme.kanagawa")

require("user.lazy")

vim.cmd("colorscheme tokyonight-night")
