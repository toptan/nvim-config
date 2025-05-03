local function set_keymaps()
  vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { desc = "[F]ormat" })
end

local function switch_source_header()
  local clients = vim.lsp.get_clients({ bufnr = 0, name = "clangd" })

  for _, v in pairs(clients) do
    if v.name == "clangd" then
      vim.cmd("LspClangdSwitchSourceHeader");
      return
    end
  end
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
