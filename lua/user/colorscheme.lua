local M = {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000,
}

function M.config()
	local opts = {
		background = "hard",
		ui_contrast = "high",
	}
	require("everforest").setup(opts)

	vim.cmd.colorscheme("everforest")
end

return M
