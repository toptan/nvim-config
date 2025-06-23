local function lsp_attach_callback(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if client == nil then
    return
  end

  if client.name == "lua_ls" then
    vim.keymap.set("n", "<leader>cf", require("stylua-nvim").format_file, { desc = "[F]ormat" })
  else
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[F]ormat" })
  end
end

vim.lsp.enable("lua_ls")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = lsp_attach_callback,
})
