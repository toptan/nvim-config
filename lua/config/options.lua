vim.opt.breakindent = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.spelloptions = "camel"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeoutlen = 500
vim.opt.undofile = true
vim.opt.updatetime = 250

vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

vim.cmd.colorscheme("retrobox")
local function set_transparent()
  local groups = {
    "Normal",
    "NormalNC",
    -- "EndOfBuffer",
    -- "NormalFloat",
    -- "FloatBorder",
    -- "SignColumn",
    -- "StatusLine",
    -- "StatusLineNC",
    -- "TabLine",
    -- "TabLineFill",
    -- "TabLineSel",
    -- "ColorColumn",
  }
  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
  end
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
end
set_transparent()
