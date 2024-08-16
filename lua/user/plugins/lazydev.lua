local M = {
	"folke/lazydev.nvim",
	ft = "lua",
}

function M.config()
	local opts = {
		library = {
			-- Load luvit types when the `vim.uv` word is found
			{
				path = "luvit-meta/library",
				words = { "vim%.uv" },
			},
		},
	}

	require("lazydev").setup(opts)
end

return M
