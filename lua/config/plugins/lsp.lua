local function switch_source_header()
  local clients = vim.lsp.get_clients({ bufnr = 0, name = "clangd" })

  for _, v in pairs(clients) do
    if v.name == "clangd" then
      vim.cmd("LspClangdSwitchSourceHeader");
      return
    end
  end
end

local toggle_inlay_hints = function()
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.inlay_hint.enable(
    not vim.lsp.inlay_hint.is_enabled({ bufnr }),
    { bufnr }
  )
end

local function set_keymaps()
  -- NOTE: Set key mappings here.
  vim.keymap.set(
    "n",
    "<leader>cf",
    "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
    { desc = "[F]ormat" }
  )

  vim.keymap.set(
    "n",
    "<leader>ca",
    "<cmd>lua vim.lsp.buf.code_action()<cr>",
    { desc = "[A]ction" }
  )

  vim.keymap.set(
    "v",
    "<leader>ca",
    "<cmd>lua vim.lsp.buf.code_action()<cr>",
    { desc = "[A]ction" }
  )

  vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "[I]nfo" })

  vim.keymap.set(
    "n",
    "<leader>th",
    toggle_inlay_hints,
    { desc = "Inlay [H]ints" }
  )

  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[R]ename" })

  vim.keymap.set(
    "n",
    "gD",
    vim.lsp.buf.declaration,
    { desc = "Goto declaration" }
  )

  vim.keymap.set(
    "n",
    "gd",
    vim.lsp.buf.definition,
    { desc = "Goto definition" }
  )

  vim.keymap.set(
    "n",
    "gr",
    vim.lsp.buf.references,
    { desc = "List references" }
  )
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("bashls")
      vim.lsp.enable("neocmakelsp")
      vim.lsp.enable("clangd")

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then
            return
          end

          vim.keymap.set("n", "<leader>cs", switch_source_header, { desc = "[S]witch header/source" })
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to [D]eclaration" })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to [d]efinition" })

          if vim.bo.filetype == "lua" or vim.bo.filetype == "cmake" then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })

      -- Enable virtual text for diagnostics
      vim.diagnostic.config({ virtual_text = true })
      set_keymaps()
    end,
  }
}
