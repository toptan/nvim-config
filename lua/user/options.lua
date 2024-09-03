-- Set <space> as the leader key
-- See: `help: mapleader`
-- NOTE: Must happen before plugins are loaded, otherwise wrong leader will be used.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable if you have nerd font.
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: For more options, see `:help option-list`.

-- Make line numbers default
vim.opt.number = true

-- Turn relative numbers on
vim.opt.relativenumber = true

-- Enable mouse mode if you wish. Can be useful for resizing splits for example
-- vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more cappital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Preview substitutions live as you type.
vim.opt.inccommand = "split"

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Show vertical line at 80th character
vim.opt.colorcolumn = "80"

-- Minimal number of screenlines to keep above and bellow the cursor.
vim.opt.scrolloff = 10

-- Expand tabs into spaces
vim.opt.expandtab = true

-- The number of spaces inserted for each indentation
vim.opt.shiftwidth = 4

-- Insert 2 spaces for a tab
vim.opt.tabstop = 4

-- Disable ruby and perl provider warnings.
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Set python executable based on the operating system.
if vim.loop.os_uname()["sysname"] == "Darwin" then
  vim.g.python3_host_prog =
    "/Library/Frameworks/Python.framework/Versions/3.12/bin/python3"
elseif vim.loop.os_uname()["sysname"] == "Linux" then
  vim.g.python3_host_prog = "/usr/bin/python3"
elseif vim.loop.os_uname()["sysname"] == "Windows_NT" then
  vim.g.python3_host_prog =
    "C:/Users/ToplicaTanaskovic/AppData/Local/Programs/Python/Python312/python.EXE"
end
