local nmap = function(lhs, rhs, desc)
    -- See `:h vim.keymap.set()`
    vim.keymap.set("n", lhs, rhs, { desc = desc })
end

Config.leader_group_clues = {
    { mode = "n", keys = "<Leader>b", desc = "+Buffer" },
    { mode = "n", keys = "<Leader>c", desc = "+Code" },
    { mode = "n", keys = "<Leader>e", desc = "+Explore/Edit" },
    { mode = "n", keys = "<Leader>f", desc = "+Find" },
    { mode = "n", keys = "<Leader>g", desc = "+Git" },
    { mode = "n", keys = "<Leader>l", desc = "+Language" },
    { mode = "n", keys = "<Leader>m", desc = "+Map" },
    { mode = "n", keys = "<Leader>o", desc = "+Other" },
    { mode = "n", keys = "<Leader>s", desc = "+Session" },
    { mode = "n", keys = "<Leader>t", desc = "+Terminal" },
    { mode = "n", keys = "<Leader>v", desc = "+Visits" },

    { mode = "x", keys = "<Leader>g", desc = "+Git" },
    { mode = "x", keys = "<Leader>l", desc = "+Language" },
}

local nmap_leader = function(suffix, rhs, desc)
    vim.keymap.set("n", "<Leader>" .. suffix, rhs, { desc = desc })
end

local xmap_leader = function(suffix, rhs, desc)
    vim.keymap.set("x", "<Leader>" .. suffix, rhs, { desc = desc })
end

local new_scratch_buffer = function()
    vim.api.nvim_win_set_buf(0, vim.api.nvim_create_buf(true, true))
end

nmap("<Tab>", "<Cmd>bnext<CR>", "Next buffer")
nmap("<S-Tab>", "<Cmd>bprev<CR>", "Previous buffer")

nmap_leader("ba", "<Cmd>b#<CR>", "Alternate")
nmap_leader("bd", "<Cmd>lua MiniBufremove.delete()<CR>", "Delete")
nmap_leader("bD", "<Cmd>lua MiniBufremove.delete(0, true)<CR>", "Delete!")
nmap_leader("bs", new_scratch_buffer, "Scratch")
nmap_leader("bw", "<Cmd>lua MiniBufremove.wipeout()<CR>", "Wipeout")
nmap_leader("bW", "<Cmd>lua MiniBufremove.wipeout(0, true)<CR>", "Wipeout!")

nmap_leader("cf", '<Cmd>lua require("conform").format()<CR>', "Format")
