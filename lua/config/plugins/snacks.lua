local function setup_bufdelete()
  local Snacks = require("snacks")
  vim.keymap.set("n", "<leader>x", Snacks.bufdelete.delete, { desc = "Delete current buffer" })
  vim.keymap.set("n", "<leader>bc", Snacks.bufdelete.delete, { desc = "Delete [C]urrent buffer" })
  vim.keymap.set("n", "<leader>bo", Snacks.bufdelete.other, { desc = "Delete [O]ther buffers" })
  vim.keymap.set("n", "<leader>ba", Snacks.bufdelete.all, { desc = "Delete [A]ll buffers" })
end

local function setup_lazygit()
  local Snacks = require("snacks")
  vim.keymap.set("n", "<leader>gl", Snacks.lazygit.log, { desc = "[L]og" })
  vim.keymap.set("n", "<leader>gf", Snacks.lazygit.log_file, { desc = "[F]ile log" })
  vim.keymap.set("n", "<leader>gg", Snacks.lazygit.open, { desc = "Open Lazy[G]it" })
end

local function setup_picker()
  local Snacks = require("snacks")
  vim.keymap.set("n", "<leader><leader>", Snacks.picker.buffers, { desc = "List buffers" })
  vim.keymap.set("n", "<leader>bl", Snacks.picker.buffers, { desc = "[L]ist buffers" })
  vim.keymap.set("n", "<leader>gb", Snacks.picker.git_branches, { desc = "[B]ranches" })
  vim.keymap.set("n", "<leader>sb", Snacks.picker.grep_buffers, { desc = "Grep in [B]uffers" })
  vim.keymap.set("n", "<leader>sf", Snacks.picker.files, { desc = "[F]iles" })
  vim.keymap.set("n", "<leader>sg", Snacks.picker.grep, { desc = "[G]rep" })
  vim.keymap.set("n", "<leader>sh", Snacks.picker.help, { desc = "[H]elp" })
  vim.keymap.set("n", "<leader>sk", Snacks.picker.keymaps, { desc = "[K]eymaps" })
  vim.keymap.set("n", "<leader>sm", Snacks.picker.man, { desc = "[M]an pages" })
  vim.keymap.set("n", "<leader>sp", Snacks.picker.projects, { desc = "[P]rojects" })
  vim.keymap.set("n", "<leader>st", Snacks.picker.treesitter, { desc = "[T]reesitter" })
end

local function snacks_config()
  require("snacks").setup({
    animate = { enabled = false },
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    dashboard = { enabled = false },
    debug = { enabled = false },
    dim = { enabled = false },
    explorer = { enabled = false },
    git = { enabled = true },
    gitbrowse = { enabled = false },
    image = { enabled = false },
    indent = { enabled = true },
    input = { enabled = false },
    layout = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = false },
    picker = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
  })

  setup_bufdelete()
  setup_lazygit()
  setup_picker()
end

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  config = snacks_config,
}
