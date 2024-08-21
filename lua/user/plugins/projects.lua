local M = {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
}

function M.config()
  require("project_nvim").setup({
    active = true,
    on_config_done = nil,
    manual_mode = false,
    detection_methods = { "pattern" },
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
    exclude_dirs = {},
    show_hidden = false,
    silent_chdir = true,
    scope_chdir = "global",
  })

  local extensions = require("telescope").extensions
  vim.keymap.set(
    "n",
    "<leader>sp",
    extensions.projects.projects,
    { noremap = true, silent = true, desc = "[S]earch [P]rojects" }
  )
end

return M
