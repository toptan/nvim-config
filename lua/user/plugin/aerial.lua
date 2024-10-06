local M = {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
}

function M.config()
  local opts = {
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
  }

  require("aerial").setup(opts)

  vim.keymap.set(
    "n",
    "<leader>a",
    "<cmd>AerialToggle!<cr>",
    { desc = "Open Aerial" }
  )
end

return M
