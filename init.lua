require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")

-- Loading colorschemes
spec("user.colorscheme.tokyonight")

-- Specifying plugins
spec("user.plugin.mini")
spec("user.plugin.dressing")
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
spec("user.plugin.nvim-cmp")
spec("user.plugin.noice")
spec("user.plugin.telescope-fzf-native")
spec("user.plugin.telescope")
spec("user.plugin.aerial")

-- Enforcing good habbits/workflow.
-- spec("user.plugin.hardtime")
spec("user.plugin.precognition")
-- spec("user.plugin.bad-practices")

-- This has to come AFTER all plugins are specified.
require("user.lazy")
