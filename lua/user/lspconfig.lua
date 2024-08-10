local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/neodev.nvim" },
	},
}

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	-- keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	-- keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
	-- keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	-- keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	-- keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
	-- keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)

	if client.supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true, { bufnr })
	end
end

function M.common_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

M.toggle_inlay_hints = function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr }), { bufnr })
end

function M.config()
	local wk = require("which-key")
	local mappings = {
		{ "<leader>l", group = "LSP" },
		-- { "<leader>la", "<cmd>Lspsaga code_action<cr>", desc = "Code action" },
		{
			"<leader>lf",
			"<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
			desc = "Format",
		},
		{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
		-- { "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<cr>", desc = "Buffer diagnostics" },
		-- { "<leader>ld", "<cmd>Lspsaga show_workspace_diagnostics<cr>", desc = "Workspace diagnostics" },
		-- { "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "CodeLens action" },
		-- { "<leader>lj", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next diagnostic" },
		-- { "<leader>lh", "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", desc = "Hints" },
		-- { "<leader>lk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev diagnostic" },
		-- { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
		-- { "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
	}

	wk.add(mappings)

	-- wk.add({
	-- 	{ "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code action", mode = "v" },
	-- })

	local lspconfig = require("lspconfig")
	local icons = require("user.icons")

	local servers = {
		"lua_ls",
		"jsonls",
		"yamlls",
    "pylsp",
	}

	local default_diagnostic_config = {
		signs = {
			active = true,
			values = {
				{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
				{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
				{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
				{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
			},
		},
		virtual_text = true,
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(default_diagnostic_config)

	for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	require("lspconfig.ui.windows").default_options.border = "rounded"

	for _, server in pairs(servers) do
		local opts = {
			on_attach = M.on_attach,
			capabilities = M.common_capabilities(),
		}

		local require_ok, settings = pcall(require, "user.lspsettings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		if server == "lua_ls" then
			require("neodev").setup({})
		end

		lspconfig[server].setup(opts)

		local function setup_lsp_diags()
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = true,
					signs = true,
					update_in_insert = false,
					underline = true,
				})
		end

		setup_lsp_diags()
	end
end

return M
