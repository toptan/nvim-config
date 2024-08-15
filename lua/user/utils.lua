-- My utility functions

local M = {}

function M.setup_buffer_keys(bufnr, mappings)
	local keymap = vim.api.nvim_buf_set_keymap
  for _, mapping in pairs(mappings) do
    keymap(bufnr, mapping.mode, mapping.keys, mapping.action, mapping.opts)
  end
end

function M.setup_keys(mappings)
  local keymap = vim.keymap.set
  for _, mapping in pairs(mappings) do
    keymap(mapping.mode, mapping.keys, mapping.action, mapping.opts)
  end
end

return M
