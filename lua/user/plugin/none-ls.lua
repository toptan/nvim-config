local M = {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
}

function M.config()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting

    local opts = {
        debug = false,
        sources = {
            formatting.stylua,
            null_ls.builtins.completion.spell,
        },
    }

    null_ls.setup(opts)
end

return M
