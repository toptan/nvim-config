local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"AndreM222/copilot-lualine",
	},
}

function M.config()
	local spaces = function()
		return require("user.icons").ui.Tab .. vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
	end

	local hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end

	local diff = {
		"diff",
		colored = true,
		cond = hide_in_width,
	}

	require("lualine").setup({
		options = {
			icons_enalbed = true,
			theme = "auto",
			disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
			always_divide_middle = true,
			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			ignore_focus = { "NvimTree" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = { "diff", "spaces", "filetype" },
			lualine_y = { "location" },
			lualine_z = { "progress" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
    tabline = {},
		extensions = { "quickfix", "man", "fugitive" },
	})
end

return M
