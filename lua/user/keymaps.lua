local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-i>", "<C-i>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<M-tab>", "<C-6>", opts)

-- Buffer navigation
keymap("n", "<Tab>", "<cmd>bnext<cr>", opts)
keymap("n", "<S-Tab>", "<cmd>bprevious<cr>", opts)

-- TODO: Do I need this?
-- keymap("n", "n", "nzz", opts)
-- keymap("n", "N", "Nzz", opts)
-- keymap("n", "*", "*zz", opts)
-- keymap("n", "#", "#zz", opts)
-- keymap("n", "g*", "g*zz", opts)
-- keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- TODO: Do I need this?
-- keymap("x", "p", [["_dP]])

-- TODO: Do I need this?
-- vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
-- vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]
-- vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
-- vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

keymap(
  "n",
  "<leader>lt",
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
    desc = "Toggle line diagnostics",
  }
)

-- TODO: Do I need this?
-- keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
-- keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- tailwind bearable to work with
keymap({ "n", "x" }, "j", "gj", opts)
keymap({ "n", "x" }, "k", "gk", opts)

-- TODO: Do I need this?
-- keymap("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", opts)

-- TODO: Do I need this?
-- vim.api.nvim_set_keymap('t', '<C-;>', '<C-\\><C-n>', opts)

-- TODO: Do I need this?
-- keymap("n", "<C-e>", ":NvimTreeFocus<cr>", { silent = true, noremap = true, desc = "Focus file explorer" })
