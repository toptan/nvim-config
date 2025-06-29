local function lsp_attach_callback(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if client == nil then
    return
  end

  local format_func = require("conform").format
  if client.name == "clangd" then
    format_func = vim.lsp.buf.format
  end
  local lsp_pick = function(scope)
    require("mini.extra").pickers.lsp({ scope = scope })
  end

  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Goto declaration" })
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[A]ction" })
  vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "Code action" })
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto definition" })
  vim.keymap.set("n", "gn", vim.lsp.buf.rename, { desc = "Rename" })
  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[R]ename" })
  vim.keymap.set("n", "<leader>cf", format_func, { desc = "[F]ormat" })

  vim.keymap.set("n", "<leader>lr", function()
    lsp_pick("references")
  end, { desc = "[R]eferences" })

  vim.keymap.set("n", "<leader>ld", function()
    lsp_pick("definition")
  end, { desc = "[d]efinitions" })

  vim.keymap.set("n", "<leader>lD", function()
    lsp_pick("declaration")
  end, { desc = "[D]eclarations" })

  vim.keymap.set("n", "<leader>li", function()
    lsp_pick("implementation")
  end, { desc = "[I]mplementations" })

  vim.keymap.set("n", "<leader>ls", function()
    lsp_pick("document_symbol")
  end, { desc = "Document [S]ymbols" })

  vim.keymap.set("n", "<leader>lt", function()
    lsp_pick("type_definition")
  end, { desc = "[T]ype definitions" })
end

vim.lsp.enable("lua_ls")
-- vim.lsp.enable("neocmakelsp")
-- vim.lsp.enable("clangd")

vim.diagnostic.config({ virtual_lines = false, virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
  callback = lsp_attach_callback,
})
