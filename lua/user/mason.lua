local M = {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
}

function M.config()
	local servers = {
		"bashls",
		"jsonls",
		"lua_ls",
		"yamlls",
    "pylsp",
    "pyright",
    "ruff",
		-- "clangd",
		-- "cmake",
		-- "bashls",
		-- "pylsp",
	}

	require("mason").setup({
		ui = {
			border = "rounded",
		},
	})

	require("mason-lspconfig").setup({
		ensure_installed = servers,
	})
end

return M
