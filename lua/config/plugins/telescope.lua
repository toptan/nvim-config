local function telescope_config()
  local builtin = require("telescope.builtin")
  vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]iles" })
  vim.keymap.set("n", "<leader>ft", builtin.live_grep, { desc = "[T]ext" })
  vim.keymap.set("n", "<leader>cd", builtin.diagnostics, { desc = "[D]iagnostics" })
end
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    {
      "echasnovski/mini.icons",
      version = false,
      config = function()
        local icons = require("mini.icons")
        icons.mock_nvim_web_devicons()
        icons.tweak_lsp_kind()
      end,
    },
  },
  config = telescope_config,
}
