require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")

-- Load colorschemes first
spec("user.colorscheme.tokyonight")
spec("user.colorscheme.kanagawa")

-- Load plugins
spec("user.plugins.toggleterm")
spec("user.plugins.whichkey")
spec("user.plugins.todo")

-- NOTE: This has to come after all plugins are specified.
require("user.lazy")

-- TODO: Figure out a better way to set colorscheme.
vim.cmd("colorscheme tokyonight-night")
