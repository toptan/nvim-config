local M = {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {},
}

function M.config()
    require("todo-comments").setup()
    vim.keymap.set("n", "<leader>sd", ":TodoTelescope<cr>", { desc = "To[D]os" })
end

return M
