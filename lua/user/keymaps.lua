-- Using semicolon to enter command mode too.
vim.keymap.set("", ";", ":")

-- Stay in indent mode.
vim.keymap.set("v", "<", "<gv", { desc = "Decrease indent" })
vim.keymap.set("v", ">", ">gv", { desc = "Increase indent" })

