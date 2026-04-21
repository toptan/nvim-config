-- Global options ===========================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Silence missing provider warnings. We don't use them anyways.
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0

-- Standard options =========================================================
-- No mouse, please!
vim.o.mouse = ""

-- Enable persistent undo
vim.o.undofile = true

-- Enable all filetype plugins and syntax if not enabled for better start up
vim.cmd("filetype plugin indent on")
if vim.fn.exists("syntax_on") ~= 1 then
    vim.cmd("syntax enable")
end

-- UI options ===============================================================
-- Indent wrapped lines to match line start
vim.o.breakindent = true

