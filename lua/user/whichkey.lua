local M = {
	"folke/which-key.nvim",
	event = "VeryLazy",
}

function M.config()
	local wk = require("which-key")

--	local mappings = {
--		{ "<leader>q", "<cmd>confirm q<cr>", desc = "Quit" },
--		{ "<leader>h", "<cmd>nohlsearch<cr>", desc = "NOHL" },
--		{ "<leader>v", "<cmd>vsplit<cr>", desc = "Split" },
--		{ "<leader>b", group = "Buffers" },
--		{ "<leader>bc", "<cmd>bd<cr>", desc = "Close current buffer" },
--		{ "<leader>f", group = "Find" },
--	}

  local mappings = {
    -- Groups
    { "<leader>f", desc = "Find" },
    { "<leader>b", desc = "Buffers" },
    { "<leader>g", desc = "Git" },
    { "<leader>l", desc = "LSP" },
    -- Actions
    { "<leader>bd", "<cmd>bp|bd #<cr>", desc = "Delete" },
    { "<leader>bp", "<cmd>bp<cr>", desc = "Previous" },
    { "<leader>bn", "<cmd>bn<cr>", desc = "Next" },

  }
	local opts = {
		mode = "n",
		prefix = "<leader>",
	}

	wk.add(mappings, opts)
end

return M
