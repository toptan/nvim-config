-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- INFO: Using semicolon to enter command mode.
vim.keymap.set("", ";", ":")

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Diagnostic keymaps
-- TODO: Figure out better key sequence or integrate with Mini.pick
--
-- vim.keymap.set(
--   "n",
--   "<leader>q",
--   vim.diagnostic.setloclist,
--   { desc = "Open diagnostic [Q]uickfix list" }
-- )

-- The following code creates a keymap to toggle inlay hints in your
-- code, if the language server you are using supports them
--
-- This may be unwanted, since they displace some of your code
--
vim.keymap.set(
  "n",
  "<leader>td",
  (function()
    local diag_status = 1 -- 1 is show; 0 is hide
    return function()
      if diag_status == 1 then
        diag_status = 0
        vim.diagnostic.hide()
      else
        diag_status = 1
        vim.diagnostic.show()
      end
    end
  end)(),
  {
    desc = "[D]iagnostics",
  }
)

-- Exit terminal mode easier. The default is <C-\><C-n>
--
-- NOTE: This won't work in all terminal emulators/tmux/etc.
--
-- vim.keymap.set("n", "<Esc><Esc>", "<C-'><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier
vim.keymap.set(
  "n",
  "<C-h>",
  "<C-w><C-h>",
  { desc = "Move focus to the left window" }
)
vim.keymap.set(
  "n",
  "<C-l>",
  "<C-w><C-l>",
  { desc = "Move focus to the right window" }
)
vim.keymap.set(
  "n",
  "<C-j>",
  "<C-w><C-j>",
  { desc = "Move focus to the lower window" }
)
vim.keymap.set(
  "n",
  "<C-k>",
  "<C-w><C-k>",
  { desc = "Move focus to the upper window" }
)

-- Buffer navigation and closing
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set(
  "n",
  "<S-Tab>",
  "<cmd>bprevious<cr>",
  { desc = "Previous buffer" }
)
vim.keymap.set(
  "n",
  "<leader>x",
  "<cmd>lua MiniBufremove.delete()<cr>",
  { desc = "Delete buffer" }
)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })

-- Toggling precognition and hardtime plugins
vim.keymap.set(
  "n",
  "<leader>tt",
  "<cmd>Hardtime toggle<cr>",
  { desc = "Hard [T]ime" }
)
vim.keymap.set(
  "n",
  "<leader>tp",
  "<cmd>Precognition toggle<cr>",
  { desc = "[P]recognition" }
)

-- Custom pickers
--
-- Recent projects
vim.keymap.set(
  "n",
  "<leader>sp",
  "<cmd>lua require('user.search').recent_projects()<cr>",
  { desc = "[P]rojects" }
)

-- Search for todos, notes, etc. via todo-comments.
vim.keymap.set(
  "n",
  "<leader>sd",
  "<cmd>lua require('user.search').todos()<cr>",
  { desc = "To[D]os" }
)
