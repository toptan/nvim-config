local M = {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	name = "catpuccin",
}

-- local M = {
--   "eldritch-theme/eldritch.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {}
-- }

function M.config()
	vim.cmd.colorscheme("catppuccin-latte")
  -- vim.cmd.colorscheme("eldritch")
end

return M
