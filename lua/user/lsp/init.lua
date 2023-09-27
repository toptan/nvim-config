local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("LSP config plugin failed to load. Check your configuration.")
    return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

