local M = {
  "nvim-telescope/telescope.nvim",
  dependnecies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      lazy = false,
    },
  },
}

function M.config()
  local opts = {
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  }

  require("telescope").setup(opts)
  require("telescope").load_extension("fzf")
  require("telescope").load_extension("projects")

  local b = require("telescope.builtin")
  local todos_cmd = "<cmd>TodoTelescope<cr>"

  -- Search
  vim.keymap.set("n", "<leader>sb", b.buffers, { desc = "[B]uffers" })
  vim.keymap.set("n", "<leader>sf", b.find_files, { desc = "[F]iles" })
  vim.keymap.set("n", "<leader>sk", b.keymaps, { desc = "[K]eymaps" })
  vim.keymap.set("n", "<leader>st", b.live_grep, { desc = "[T]ext" })

  -- Code
  vim.keymap.set("n", "<leader>cd", b.diagnostics, { desc = "[D]iagnostic" })

  -- Recent projects
  vim.keymap.set(
    "n",
    "<leader>sp",
    "<cmd>Telescope projects<cr>",
    { desc = "[P]rojects" }
  )

  -- Search for todos, notes, etc. via todo-comments.
  vim.keymap.set("n", "<leader>sd", todos_cmd, { desc = "To[D]os" })
end

return M
