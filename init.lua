require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")

-- Loading colorschemes
spec("user.colorscheme.citruszest")
spec("user.colorscheme.everforest")
spec("user.colorscheme.kanagawa")
spec("user.colorscheme.tokyonight")
spec("user.colorscheme.catppuccin")

-- Specifying plugins
spec("user.plugin.mini")
spec("user.plugin.nvim-treesitter")
spec("user.plugin.mason-lsp-config")
spec("user.plugin.mason-null-ls")
spec("user.plugin.none-ls")
spec("user.plugin.nvim-lspconfig")
spec("user.plugin.todo-comments")
spec("user.plugin.toggleterm")
spec("user.plugin.project")
spec("user.plugin.neogit")
spec("user.plugin.gitsigns")

-- Enforcing good habbits/workflow.
-- spec("user.plugin.hardtime")
spec("user.plugin.precognition")
-- spec("user.plugin.bad-practices")

-- This has to come AFTER all plugins are specified.
require("user.lazy")
