-- TODO: Set up integrations with sindrets diffview and telescope.
local M = {
  "NeogitOrg/neogit",
  event = "VeryLazy",
}

function M.config()
  vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neo[G]it" })

  local icons = require("user.icons")
  local opts = {
    -- Change the default way of opening neogit
    kind = "tab",
    -- Change the default way of opening the commit view
    commit_view = {
      kind = "split",
    },
    -- Change the default way of opening popups
    popup = {
      kind = "split",
    },
    -- customize displayed signs
    signs = {
      -- { CLOSED, OPENED }
      section = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
      item = { icons.ui.ChevronRight, icons.ui.ChevronShortDown },
      hunk = { "", "" },
    },
  }

  require("neogit").setup(opts)
end

return M
