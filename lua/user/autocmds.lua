vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	callback = function()
		vim.cmd("set formatoptions-=cro")
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"netrw",
		"Jaq",
		"qf",
		"git",
		"help",
		"man",
		"lspinfo",
		"oil",
		"spectre_panel",
		"lir",
		"DressingSelect",
		"tsplayground",
		"",
	},
	callback = function()
		vim.cmd([[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]])
	end,
})

vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
	callback = function()
		vim.cmd("quit")
	end,
})

vim.api.nvim_create_autocmd({ "VimResized" }, {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd("checktime")
	end,
})

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 40 })
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
	callback = function()
		local status_ok, luasnip = pcall(require, "luasnip")
		if not status_ok then
			return
		end
		if luasnip.expand_or_jumpable() then
			-- ask maintainer for option to make this silent
			-- luasnip.unlink_current()
			vim.cmd([[silent! lua require("luasnip").unlink_current()]])
		end
	end,
})

-- Make :bd and :q behave as usual when tree is visible
-- vim.api.nvim_create_autocmd({ "BufEnter", "QuitPre" }, {
--	nested = false,
--	callback = function(e)
--		local tree = require("nvim-tree.api").tree

		-- Nothing to do if tree is not opened
--		if not tree.is_visible() then
--			return
--		end

		-- How many focusable windows do we have? (excluding e.g. incline status window)
--		local winCount = 0
--		for _, winId in ipairs(vim.api.nvim_list_wins()) do
--			if vim.api.nvim_win_get_config(winId).focusable then
--				winCount = winCount + 1
--			end
--		end

		-- We want to quit and only one window besides tree is left
--		if e.event == "QuitPre" and winCount == 2 then
--			vim.api.nvim_cmd({ cmd = "qall" }, {})
--		end

		-- :bd was probably issued an only tree window is left
		-- Behave as if tree was closed (see `:h :bd`)
--		if e.event == "BufEnter" and winCount == 1 then
			-- Required to avoid "Vim:E444: Cannot close last window"
--			vim.defer_fn(function()
				-- close nvim-tree: will go to the last buffer used before closing
--				tree.toggle({ find_file = true, focus = true })
				-- re-open nivm-tree
--				tree.toggle({ find_file = true, focus = false })
--			end, 10)
--		end
--	end,
--})
