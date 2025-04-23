return {
  {
    "echasnovski/mini.nvim",
    version = false,
    enabled = true,
    config = function()
      require("config.mini.icons").setup()
      require("config.mini.statusline").setup()
      require("config.mini.starter").setup()
      require("config.mini.clue").setup()
      require("config.mini.completion").setup()
    end
  },
}
