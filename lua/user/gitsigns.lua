local M = {
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	cmd = "Gitsigns",
}

M.config = function()
	local wk = require("which-key")
	local mappings = {
		{ "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
		{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
		{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
		{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
		{ "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
		{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
		{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
		{ "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
		{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
	}

	wk.add(mappings)

	vim.api.nvim_set_hl(0, "GitSignsAdd", { link = "GitSignsAdd" })
	vim.api.nvim_set_hl(0, "GitSignsAddNr", { link = "GitSignsAddNr" })
	vim.api.nvim_set_hl(0, "GitSignsAddLn", { link = "GitSignsAddLn" })
	vim.api.nvim_set_hl(0, "GitSignsChange", { link = "GitSignsChange" })
	vim.api.nvim_set_hl(0, "GitSignsChangeNr", { link = "GitSignsChangeNr" })
	vim.api.nvim_set_hl(0, "GitSignsChangeLn", { link = "GitSignsChangeLn" })
	vim.api.nvim_set_hl(0, "GitSignsDelete", { link = "GitSignsDelete" })
	vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { link = "GitSignsDeleteNr" })
	vim.api.nvim_set_hl(0, "GitSignsDeleteLn", { link = "GitSignsDeleteLn" })

	local opts = {
		watch_gitdir = {
			interval = 1000,
			follow_files = true,
		},
		attach_to_untracked = true,
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
		update_debounce = 200,
		max_file_length = 40000,
		preview_config = {
			border = "rounded",
			style = "minimal",
			relative = "cursor",
			row = 0,
			col = 1,
		},
	}

	require("gitsigns").setup(opts)
end

return M
