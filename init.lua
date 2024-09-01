require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")

-- Specifying plugins
spec("user.plugin.mini")
spec("user.plugin.mason-lsp-config")
spec("user.plugin.mason-null-ls")
spec("user.plugin.none-ls")
spec("user.plugin.nvim-lspconfig")

-- Enforcing good habbits/workflow.
spec("user.plugin.hardtime")
spec("user.plugin.precognition")
spec("user.plugin.bad-practices")

-- This has to come AFTER all plugins are specified.
require("user.lazy")

vim.cmd.colorscheme("retrobox")
