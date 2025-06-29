return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "sindrets/diffview.nvim", opts = {} },
  },
  config = function()
    require("neogit").setup()
    vim.keymap.set("n", "<leader>gg", require("neogit").open, { desc = "Neo[g]it" })
  end,
}
