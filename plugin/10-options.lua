-- Set up the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- We do have nerd font
vim.g.have_nerd_font = true

-- Disable providers
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

-- Enable all filetype plugins and syntax (if not enabled, for better startup)
vim.cmd("filetype plugin indent on")
if vim.fn.exists("syntax_on") ~= 1 then
    vim.cmd("syntax enable")
end

vim.o.number = true
vim.o.relativenumber = true
vim.o.numberwidth = 5
vim.o.showmode = false
-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this.o.on if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
    vim.o.clipboard = "unnamedplus"
end)

vim.o.breakindent = true
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or one or more cappital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 500
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
-- Preview substitutions live as you type.
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.colorcolumn = "80"
vim.o.scrolloff = 10
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

-- Pattern for a start of numbered list (used in `gw`). This reads as
-- "Start of list item is: at least one special character (digit, -, +, *)
-- possibly followed by punctuation (. or `)`) followed by at least one space".
vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]

vim.o.fillchars = "eob: ,fold:╌"
vim.o.listchars = "extends:…,nbsp:␣,precedes:…,tab:» ,trail:·"

-- Folds (see `:h fold-commands`, `:h zM`, `:h zR`, `:h zA`, `:h zj`)
vim.o.foldlevel = 10 -- Fold nothing by default; set to 0 or 1 to fold
vim.o.foldmethod = "indent" -- Fold based on indent level
vim.o.foldnestmax = 10 -- Limit number of fold levels
vim.o.foldtext = "" -- Show text under fold with its highlighting

vim.o.autoindent = true -- Use auto indent
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.formatoptions = "rqnl1j" -- Improve comment editing
vim.o.ignorecase = true -- Ignore case during search
vim.o.incsearch = true -- Show search matches while typing
vim.o.infercase = true -- Infer case in built-in completion
vim.o.shiftwidth = 2 -- Use this number of spaces for indentation
vim.o.smartcase = true -- Respect case if search pattern has upper case
vim.o.smartindent = true -- Make indenting smart
vim.o.spelloptions = "camel" -- Treat camelCase word parts as separate words
vim.o.tabstop = 2 -- Show tab as this number of spaces
vim.o.virtualedit = "block" -- Allow going past end of line in blockwise mode

vim.o.iskeyword = "@,48-57,_,192-255,-" -- Treat dash as `word` textobject part

-- Built-in completion
vim.o.complete = ".,w,b,kspell" -- Use less sources
vim.o.completeopt = "menuone,noselect,fuzzy,nosort" -- Use custom behavior
vim.o.completetimeout = 100 -- Limit sources delay

-- Don't auto-wrap comments and don't insert comment leader after hitting 'o'.
-- Do on `FileType` to always override these changes from filetype plugins.
local f = function()
    vim.cmd("setlocal formatoptions-=c formatoptions-=o")
end
Config.new_autocmd("FileType", nil, f, "Proper 'formatoptions'")
