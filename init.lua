require("user.launch")
require("user.options")
require("user.keymaps")
require("user.autocmds")

spec("user.colorschemes.kanagawa")
spec("user.whichkey")
spec("user.toggleterm")
spec("user.devicons")
spec("user.nvimtree")
spec("user.todo")
spec("user.comment")
spec("user.neogit")
spec("user.alpha")
spec("user.mason")
spec("user.mason-null-ls")
spec("user.lspconfig")
spec("user.none-ls")
spec("user.treesitter")
spec("user.gitsigns")

require("user.lazy")

vim.cmd("colorscheme kanagawa")
