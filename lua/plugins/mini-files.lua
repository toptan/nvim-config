return {
  "nvim-mini/mini.files",
  version = false,
  opts = {},
  keys = {
    {
      "<Leader>fe",
      function()
        require("mini.files").open()
      end,
      desc = "Using [e]xplorer",
    },
    {
      "-",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), false)
      end,
      desc = "Current buffer directory",
    },
  },
}
