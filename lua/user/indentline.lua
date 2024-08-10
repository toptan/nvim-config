local M = {
	"lukas-reineke/indent-blankline.nvim",
	event = "VeryLazy",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {}
	-- commit = "9637670896b68805430e2f72cf5d16be5b97a22a",
}

function M.config()
	local icons = require("user.icons")

	require("ibl").setup()
end

return M
