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
      require("config.mini.files").setup()
      require("config.mini.pick").setup()
      require("config.mini.extra").setup()
      require("config.mini.hipatterns").setup()

      require("mini.pairs").setup()
      require("mini.surround").setup()
      require("mini.notify").setup()
    end
  },
}
