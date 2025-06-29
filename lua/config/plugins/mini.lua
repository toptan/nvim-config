local function mini_setup()
  require("config.mini.ai").setup()
  require("config.mini.bracketed").setup()
  require("config.mini.bufremove").setup()
  require("config.mini.clue").setup()
  require("config.mini.completion").setup()
  require("config.mini.cursorword").setup()
  require("config.mini.diff").setup()
  require("config.mini.extra").setup()
  require("config.mini.files").setup()
  require("config.mini.fuzzy").setup()
  require("config.mini.git").setup()
  require("config.mini.hipatterns").setup()
  require("config.mini.icons").setup()
  require("config.mini.indentscope").setup()
  require("config.mini.keymap").setup()
  require("config.mini.move").setup()
  require("config.mini.notify").setup()
  require("config.mini.pairs").setup()
  require("config.mini.pick").setup()
  require("config.mini.sessions").setup()
  require("config.mini.starter").setup()
  require("config.mini.statusline").setup()
  require("config.mini.surround").setup()
end

return {
  "echasnovski/mini.nvim",
  version = false,
  config = mini_setup,
}
