local M = {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	name = "catpuccin",
}

function M.config()
	vim.cmd.colorscheme("catppuccin-mocha")
end

return M
