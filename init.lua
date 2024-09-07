require("user.launch")
require("user.options")
require("user.autocommands")
require("user.keymaps")

-- Colorschemes
spec("user.colorscheme.catppuccin")

-- Icons
spec("user.plugin.mini-icons")

-- Plugins
spec("user.plugin.nvim-treesitter")
spec("user.plugin.telescope")

-- Workflow enforcing/training



-- Plugin manager comes last
require("user.lazy")
