-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Disable mini.completion for snacks picker
vim.api.nvim_create_autocmd("FileType", {
  pattern = "snacks_picker_input",
  desc = "Disable mini.completion for snacks picker",
  group = vim.api.nvim_create_augroup("user_mini", { clear = true }),
  command = "lua vim.b.minicompletion_disable=true",
})
