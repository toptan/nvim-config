local function lsp_attach_callback(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if client == nil then
    return
  end

  local format_func = require("conform").format
  if client.name == "clangd" then
    format_func = vim.lsp.buf.format
  end
  vim.keymap.set("n", "<leader>cf", format_func, { desc = "[F]ormat" })
end

vim.lsp.enable("lua_ls")
vim.lsp.enable("neocmakelsp")

vim.diagnostic.config({ virtual_lines = true })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = lsp_attach_callback,
})
