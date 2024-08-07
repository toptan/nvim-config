local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")

	local mappings = {
		{ "<leader>q", "<cmd>confirm q<cr>", desc = "Quit" },
		{ "<leader>h", "<cmd>nohlsearch<cr>", desc = "NOHL" },
		{ "<leader>v", "<cmd>vsplit<cr>", desc = "Split" },
		{ "<leader>b", group = "Buffers" },
		{ "<leader>bc", "<cmd>bd<cr>", desc = "Close current buffer" },
		{ "<leader>f", group = "Find" },
	}

	local opts = {
		mode = "n",
		prefix = "<leader>",
	}

	wk.add(mappings, opts)
end

return M
