-- [[ Basic autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking text
--  Try it with `yap` in normal node
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup(
    "kickstart-highlight-yank",
    { clear = true }
  ),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- NOTE: There must be a better way to set comment string for C++.
vim.api.nvim_create_autocmd("FileType", {
  desc = "Fixing comment string for C++",
  group = vim.api.nvim_create_augroup("FixCppCommentString", { clear = true }),
  callback = function(event)
    vim.bo[event.buf].commentstring = "// %s"
  end,
  pattern = { "cpp", "hpp" },
})
