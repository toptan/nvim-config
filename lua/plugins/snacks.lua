return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    animate = { enabled = false },
    bigfile = { enabled = false },
    bufdelete = { enabled = true },
    dashboard = { enabled = false },
    debug = { enabled = false },
    dim = { enabled = false }, -- TODO: Revisit this
    explorer = { enabled = false }, -- TODO: Revisit this
    git = { enabled = true },
    gitbrowse = { enabled = false },
    image = { enabled = false },
    indent = { enabled = true, animate = { enabled = false } },
    input = { enabled = true },
    layout = { enabled = false },
    lazygit = { enabled = true },
    notifier = { enabled = false },
    picker = { enabled = true, layout = { cycle = false } },
  },
  keys = {
    {
      "<Leader>x",
      function()
        require("snacks").bufdelete.delete()
      end,
      desc = "Delete current buffer",
    },
    {
      "<Leader>bd",
      function()
        require("snacks").bufdelete.delete()
      end,
      desc = "[d]elete",
    },
    {
      "<Leader>bo",
      function()
        require("snacks").bufdelete.delete()
      end,
      desc = "Delete [o]thers",
    },
    {
      "<Leader>ba",
      function()
        require("snacks").bufdelete.delete()
      end,
      desc = "Delete [a]ll",
    },
    {
      "<Leader><Leader>",
      function()
        require("snacks").picker.buffers()
      end,
      desc = "Pick buffer",
    },
    {
      "<Leader>ff",
      function()
        require("snacks").picker.files()
      end,
      desc = "[f]iles",
    },
    {
      "<Leader>fc",
      function()
        require("snacks").picker.files({ cwd = "~/.config/nvim" })
      end,
      desc = "Neovim [c]onfig",
    },
    {
      "<Leader>st",
      function()
        require("snacks").picker.todo_comments()
      end,
      desc = "[T]odo comments",
    },
  },
}
