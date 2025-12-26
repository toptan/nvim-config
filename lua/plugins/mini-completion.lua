local kind_priority = { Text = -1, Snippet = 99 }
local opts = { filtersort = "fuzzy", kind_priority = kind_priority }
local process_items = function(items, base)
  return require("mini.completion").default_process_items(items, base, opts)
end

local on_attach = function(args)
  vim.bo[args.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
end
vim.api.nvim_create_autocmd("LspAttach", { callback = on_attach })

return {
  "nvim-mini/mini.completion",
  version = false,
  lazy = false,
  opts = {
    lsp_completion = {
      process_items = process_items,
      source_func = "omnifunc",
      auto_setup = false,
    },
  },
}
