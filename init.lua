require("user.launch")
require("user.options")
require("user.autocommands")
require("user.keymaps")

-- Colorschemes
spec("user.colorscheme.catppuccin")
spec("user.colorscheme.tokyonight")

-- Icons
spec("user.plugin.mini-icons")

-- Plugins
spec("user.plugin.nvim-treesitter")
spec("user.plugin.telescope")
spec("user.plugin.none-ls")
spec("user.plugin.mason-null-ls")
spec("user.plugin.mason-lspconfig")
spec("user.plugin.nvim-lspconfig")
spec("user.plugin.which-key")
spec("user.plugin.nvim-cmp")
spec("user.plugin.gitsigns")
spec("user.plugin.todo-comments")
spec("user.plugin.lualine")

-- Workflow enforcing/training


-- Plugin manager comes last
require("user.lazy")
