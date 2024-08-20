-- [[ Basic autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking text
--  Try it with `yap` in normal node
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Configure highlighting of the word under cursor
local function cursorword_blocklist()
  local curword = vim.fn.expand("<cword>")
  local filetype = vim.bo.filetype

  -- Add any disabling global or file specific logic here
  local blocklist = {}
  if filetype == "lua" then
    blocklist = { "local", "require", "spec" }
  elseif filetype == "javascript" then
    blocklist = { "import" }
  end

  vim.b.minicursorword_disable = vim.tbl_contains(blocklist, curword)
end
  -- vim.cmd('au CursorMoved * lua _G.cursorword_blocklist()')
vim.api.nvim_create_autocmd("CursorMoved", {
  desc = "Disable highlight of certain words under the cursor",
  group = vim.api.nvim_create_augroup("kickstart-cursor-moved", {}),
  callback = cursorword_blocklist,
})


