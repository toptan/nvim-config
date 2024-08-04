local M = {
	"goolord/alpha-nvim",
	event = "VimEnter",
}

function M.config()
	local dashboard = require("alpha.themes.dashboard")

	dashboard.section.header.val = {
		[[          ██╗   ██╗███╗   ██╗██╗██╗  ██╗]],
		[[          ██║   ██║████╗  ██║██║╚██╗██╔╝]],
		[[          ██║   ██║██╔██╗ ██║██║ ╚███╔╝ ]],
		[[          ██║   ██║██║╚██╗██║██║ ██╔██╗ ]],
		[[           ██████╔╝██║ ╚████║██║██╔╝ ██╗]],
		[[           ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝]],
		[[]],
		[[                        ██╗    ]],
		[[                        ██║    ]],
		[[                    ██████████╗]],
		[[                    ╚═══██╔═══╝]],
		[[                        ██║    ]],
		[[                        ╚═╝    ]],
		[[]],
		[[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
		[[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
		[[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
		[[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
		[[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
		[[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
		[[                                                  ]],
		[[     Where there is a shell, there is a way.      ]],
	}

	local footer = {
		[[]],
		[[The computing scientist’s main challenge is not to]],
		[[get confused by the complexities of his own making.]],
		[[]],
		[[                              -- Edsger W. Dijkstra]],
	}

	dashboard.section.footer.val = footer

	dashboard.section.buttons.val = {
		dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
		dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
		dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
		dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
		dashboard.button("t", "󱎸  Find text", ":Telescope live_grep <CR>"),
		dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
		dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
	}

	dashboard.section.header.opts.hl = "Character"
	dashboard.section.buttons.opts.hl = "Include"
	dashboard.section.footer.opts.hl = "Type"

	require("alpha").setup(dashboard.opts)

	vim.api.nvim_create_autocmd({ "User" }, {
		pattern = { "AlphaReady" },
		callback = function()
			vim.cmd([[
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]])
		end,
	})
end

return M
