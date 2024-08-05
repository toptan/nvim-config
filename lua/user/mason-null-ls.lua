local M = {
	"jay-babu/mason-null-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
}

function M.config()
	local cfg = {
		ensure_installed = {
			"stylua",
			"black",
			"prettier",
			"clang-format",
			"cmakelang",
			"jq",
			"xmlformatter",
			"yamllint",
		},
	}

	require("mason-null-ls").setup(cfg)
end

return M
