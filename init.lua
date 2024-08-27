require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")

-- Load colorschemes first
spec("user.colorscheme.everforest")
spec("user.colorscheme.tokyonight")
spec("user.colorscheme.kanagawa")

-- Load plugins
spec("user.plugins.toggleterm")
spec("user.plugins.whichkey")
spec("user.plugins.todo")
spec("user.plugins.gitsigns")
spec("user.plugins.neogit")
spec("user.plugins.mini")
spec("user.plugins.telescope")
spec("user.plugins.nvim-cmp")
spec("user.plugins.mason")
spec("user.plugins.mason-null-ls")
spec("user.plugins.none-ls")
spec("user.plugins.lspconfig")
spec("user.plugins.treesitter")
spec("user.plugins.projects")
spec("user.plugins.autopairs")
spec("user.plugins.comment")

-- NOTE: This has to come after all plugins are specified.
require("user.lazy")
