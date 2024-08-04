local M = {
	"folke/trouble.nvim",
	lazy = true,
  cmd = "Trouble",
}

function M.config()
	local t = require("trouble")
	t.setup()
end

return M
