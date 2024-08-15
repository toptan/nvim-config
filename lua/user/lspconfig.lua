local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neodev.nvim" },
  },
}

local function lsp_keymaps(bufnr)
  local mappings = {
    {
      mode = "n",
      keys = "gD",
      action = "<cmd>lua vim.lsp.buf.declaration()<cr>",
      opts = { noremap = true, silent = true, desc = "Goto declaration" },
    },
    {
      mode = "n",
      keys = "gd",
      action = "<cmd>lua vim.lsp.buf.definition()<cr>",
      opts = { noremap = true, silent = true, desc = "Goto definition" },
    },
    {
      mode = "n",
      keys = "K",
      action = "<cmd>lua vim.lsp.buf.hover()<cr>",
      opts = { noremap = true, silent = true, desc = "Hover docs" },
    },
    {
      mode = "n",
      keys = "gI",
      action = "<cmd>lua vim.lsp.buf.implementation()<cr>",
      opts = { noremap = true, silent = true, desc = "Goto implementation" },
    },
    {
      mode = "n",
      keys = "gr",
      action = "<cmd>lua vim.lsp.buf.references()<cr>",
      opts = { noremap = true, silent = true, desc = "Show references" },
    },
    {
      mode = "n",
      keys = "gl",
      action = "<cmd>lua vim.diagnostic.open_float()<cr>",
      opts = { noremap = true, silent = true, desc = "Float diagnostics" },
    },
  }

  local utils = require("user.utils")
  utils.setup_buffer_keys(bufnr, mappings)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  if client.supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint.enable(true, { bufnr })
  end
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

M.toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr }), { bufnr })
end

function M.config()
  local utils = require("user.utils")
  local mappings = {
    {
      mode = "n",
      keys = "<leader>li",
      action = "<cmd>LspInfo<cr>",
      opts = { noremap = true, silent = true, desc = "Info" },
    },
    {
      mode = "n",
      keys = "<leader>lf",
      action =
      "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
      opts = { noremap = true, silent = true, desc = "Format" },
    },
    {
      mode = "v",
      keys = "<leader>la",
      action = "<cmd>lua vim.lsp.buf.code_action()<cr>",
      opts = { noremap = true, silent = true, desc = "Code action" },
    },
    {
      mode = "n",
      keys = "<leader>la",
      action = "<cmd>lua vim.lsp.buf.code_action()<cr>",
      opts = { noremap = true, silent = true, desc = "Code action" },
    },
    {
      mode = "n",
      keys = "<leader>lj",
      action = "<cmd>lua vim.diagnostic.goto_next()<cr>",
      opts = { noremap = true, silent = true, desc = "Next diagnostic" },
    },
    {
      mode = "n",
      keys = "<leader>lk",
      action = "<cmd>lua vim.diagnostic.goto_prev()<cr>",
      opts = { noremap = true, silent = true, desc = "Prevoius diagnostic" },
    },
  }

  utils.setup_keys(mappings)

  local lspconfig = require("lspconfig")
  local icons = require("user.icons")

  local servers = {
    "lua_ls",
    "jsonls",
    "yamlls",
    "pyright",
    "ruff",
    "pylsp",
    "lemminx",
    -- "clangd",
    -- "cmake",
  }

  local default_diagnostic_config = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
      },
    },
    virtual_text = true,
    update_in_insert = false,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(default_diagnostic_config)

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] =
      vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "user.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup({})
    end

    lspconfig[server].setup(opts)

    local function setup_lsp_diags()
      vim.lsp.handlers["textDocument/publishDiagnostics"] =
          vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = true,
            signs = true,
            update_in_insert = false,
            underline = true,
          })
    end

    setup_lsp_diags()
  end
end

return M
