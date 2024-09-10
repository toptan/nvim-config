local M = {
    "nvim-lualine/lualine.nvim",
}

function M.config()
    local opts = {
        options = {
            theme = require("lualine.themes.catppuccin-mocha"),
        },
    }
    require("lualine").setup(opts)
end

return M
