local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
}

function M.config()
    local configs = require("nvim-treesitter.configs")
    local opts = {
        ensure_installed = {
            "bash",
            "c",
            "cmake",
            "cpp",
            "json",
            "lua",
            "markdown",
            "python",
            "regex",
            "vim",
            "vimdoc",
            "yaml",
        },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
    }
    configs.setup(opts)
    require("nvim-treesitter").setup()
end

return M
