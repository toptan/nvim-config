vim.g.have_nerd_font = true
vim.g.termguicolors = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
  -- vim.opt.clipboard = "unnamedplus"
-- end)

vim.opt.breakindent = true
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or one or more cappital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
-- Preview substitutions live as you type.
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.scrolloff = 10
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Disable ruby and perl provider warnings.
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Set python executable based on the operating system.
if vim.loop.os_uname()["sysname"] == "Darwin" then
  vim.g.python3_host_prog =
    "/Library/Frameworks/Python.framework/Versions/3.12/bin/python3"
elseif vim.loop.os_uname()["sysname"] == "Linux" then
  vim.g.python3_host_prog = "python3"
elseif vim.loop.os_uname()["sysname"] == "Windows_NT" then
  vim.g.python3_host_prog =
    "C:/Users/ToplicaTanaskovic/AppData/Local/Programs/Python/Python312/python.EXE"
end
