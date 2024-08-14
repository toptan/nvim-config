local M = {
	"goolord/alpha-nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
	event = "VimEnter",
}

local function header_func()
  local hour = tonumber(vim.fn.strftime("%H"))
  -- [04:00, 12:00) - morning, [12:00, 20:00) - day, [20:00, 04:00) - evening
  local part_id = math.floor((hour + 4) / 8) + 1
  local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
  local username = vim.loop.os_get_passwd()["username"] or "USERNAME"

  return ("Good %s, %s!"):format(day_part, username)
end

function M.config()
	local dashboard = require("alpha.themes.dashboard")

	-- dashboard.section.header.val = {
	-- 	[[          ██╗   ██╗███╗   ██╗██╗██╗  ██╗]],
	-- 	[[          ██║   ██║████╗  ██║██║╚██╗██╔╝]],
	-- 	[[          ██║   ██║██╔██╗ ██║██║ ╚███╔╝ ]],
	-- 	[[          ██║   ██║██║╚██╗██║██║ ██╔██╗ ]],
	-- 	[[           ██████╔╝██║ ╚████║██║██╔╝ ██╗]],
	-- 	[[           ╚═════╝ ╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝]],
	-- 	[[]],
	-- 	[[                        ██╗    ]],
	-- 	[[                        ██║    ]],
	-- 	[[                    ██████████╗]],
	-- 	[[                    ╚═══██╔═══╝]],
	-- 	[[                        ██║    ]],
	-- 	[[                        ╚═╝    ]],
	-- 	[[]],
	-- 	[[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
	-- 	[[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
	-- 	[[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
	-- 	[[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
	-- 	[[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
	-- 	[[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
	-- 	[[                                                  ]],
	-- 	[[     Where there is a shell, there is a way.      ]],
	-- }

  dashboard.section.header.val = { 
    [[]],
    [[]],
    [[]],
    [[]],
    header_func(),
    [[]],
    [[Where there is a shell, there is a way.]],
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

	-- dashboard.section.header.opts.hl = "Function"
	-- dashboard.section.buttons.opts.hl = "Function"
	-- dashboard.section.footer.opts.hl = "Type"

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
