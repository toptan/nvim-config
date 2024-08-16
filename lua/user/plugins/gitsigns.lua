local M = {
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	cmd = "Gitsigns",
}

function M.config()
	local opts = {
		-- signs = {
		--   add = { text = '+' },
		--   change = { text = '~' },
		--   delete = { text = '_' },
		--   topdelete = { text = '‾' },
		--   changedelete = { text = '~' },
		-- },
	}
	require("gitsigns").setup(opts)
end

return M
