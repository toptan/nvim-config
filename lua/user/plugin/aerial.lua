local M = {
  "stevearc/aerial.nvim",
  opts = {},
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}

function M.config()
  local options = {
    on_attach = function(bufnr)
      vim.keymap.set("n", "{", "<cmd>AerialPrev<cr>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<cr>", { buffer = bufnr })
    end,
  }

  require("aerial").setup(options)
end

return M
