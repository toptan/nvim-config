local M = {}

function M.setup()
  local kind_priority = { Text = -1, Snippet = 99 }
  local opts = { filtersort = "fuzzy", kind_priority = kind_priority }
  local process_items = function(items, base)
    return require("mini.completion").default_process_items(items, base, opts)
  end
  require("mini.completion").setup({
    lsp_completion = { process_items = process_items },
  })
end

return M
