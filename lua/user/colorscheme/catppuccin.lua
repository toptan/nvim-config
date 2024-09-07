local M = {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    init = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}

function M.config()
    require("catppuccin").setup()
end

return M
