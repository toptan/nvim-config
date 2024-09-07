local M = {
    "echasnovski/mini.icons",
    version = false,
    lazy = false,
}

function M.config()
    require("mini.icons").setup()
    require("mini.icons").mock_nvim_web_devicons()
end

return M
