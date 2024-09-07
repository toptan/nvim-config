local M = {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-fzf-native.nvim" },
        { "nvim-telescope/telescope-ui-select.nvim" },
    },
}

function M.config()
    local opts = {
        pickers = {
            colorscheme = {
                enable_preview = true,
            },
        },
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown(),
            },
        },
    }

    local telescope = require("telescope")
    telescope.setup(opts)

    -- Enable telescope extensions if they are installed.
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")

    -- TODO: Set aditional keymappings.
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[H]elp" })
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[F]iles" })
    vim.keymap.set("n", "<leader>st", builtin.live_grep, { desc = "[T]ext" })

    vim.keymap.set(
        "n",
        "<leader>cd",
        builtin.diagnostics,
        { desc = "[D]iagnostics" }
    )
end

return M
