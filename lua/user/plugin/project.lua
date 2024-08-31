local M = {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
}

function M.config()
    local options = {
        active = true,
        on_config_done = nil,
        manual_mode = false,
        detection_methods = { "lsp", "pattern" },
        patterns = {
            ".git",
            "_darcs",
            ".hg",
            ".bzr",
            ".svn",
            "Makefile",
            "CMakeLists.txt",
            ".venv",
            "package.json",
            "pom.xml",
        },
        ignore_lsp = {},
        exclide_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = "global",
    }

    require("project_nvim").setup(options)
end

return M
