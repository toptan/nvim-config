local options = {
	backup = false,					-- don't create backup files
	cmdheight = 2,					-- more space for displaying messages
	cursorline = true,				-- highlight the current line
	expandtab = true,				-- convert tabs to spaces
	fileencoding = "utf-8",			-- encode all file as utf-8
	ignorecase = true,				-- ignoring case in search patterns
	number = true,					-- show line numbers
	numberwidth = 4,				-- set number column witdh to 4
	pumheight = 10,					-- pop up menu height
	shiftwidth = 4,					-- number of spaces inserted for each indentation level
	showtabline = 2,				-- always show tabs
	signcolumn = "yes",				-- slways show the sign column, otherwise it will shift text when shown
	smartcase = true,				-- smart case
	smartindent = true,				-- smarted intentation
	splitbelow = true,				-- always make horizontal split to go bellow current window
	splitright = true,				-- always make vertical split to go to the right of the current window
	swapfile = false,				-- don't create swap file
	tabstop = 4,					-- insert 4 spaces for one tab
    -- termguicolors = true,           -- set terminal gui colors (most terminals support this)
    wrap = true                     -- display long lines wrapped
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.cmd "colorscheme desert"
