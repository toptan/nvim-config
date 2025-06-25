local function telescope_config()
  require("telescope").load_extension("fzf")
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "for [F]iles" })
  vim.keymap.set("n", "<leader>st", builtin.live_grep, { desc = "for [T]ext" })

  vim.keymap.set("n", "<leader>cd", builtin.diagnostics, { desc = "[D]iagnostics" })

  vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Buffers" })

  vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "[S]tatus" })
end

local function mini_icons_config()
  local icons = require("mini.icons")
  icons.mock_nvim_web_devicons()
  icons.tweak_lsp_kind()
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "echasnovski/mini.icons", version = false, config = mini_icons_config },
  },
  config = telescope_config,
}
