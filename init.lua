require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")

-- Load colorscheme first.
spec("user.colorscheme.tokyonight")
spec("user.colorscheme.kanagawa")
spec("user.colorscheme.citruszest")

-- Load plugins.
spec("user.plugin.mini-icons")
spec("user.plugin.treesitter")
spec("user.plugin.noice")
spec("user.plugin.which-key")
spec("user.plugin.nvim-tree")
spec("user.plugin.todo-comments")

-- Enforcing good habbits/workflow.
spec("user.plugin.hardtime")
spec("user.plugin.precognition")
spec("user.plugin.bad-practices")

-- NOTE: This has to come after all plugins are specified.
require("user.lazy")
