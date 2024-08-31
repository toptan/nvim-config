local M = {
    "rebelot/heirline.nvim",
}

function M.config()
    local colors = require("tokyonight.colors").setup()

    local StatusLine = {
        require("user.heirline.mode"),
        require("user.heirline.file"),
    }
    local options = {
        statusline = StatusLine,
        opts = {
            colors = colors,
        }
    }
    require("heirline").setup(options)
end

return M
