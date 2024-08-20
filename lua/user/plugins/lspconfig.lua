local M = {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    {
      -- NOTE: Must be loaded before dependants
      "williamboman/mason.nvim",
      config = true,
    },
    {
      "williamboman/mason-lspconfig.nvim",
    },
    {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    {
      "j-hui/fidget.nvim",
      opts = {},
    },
    -- Allows extra capabilities provided by nvim-cmp
    {
      "hrsh7th/cmp-nvim-lsp",
    },
  },
}

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

function M.config()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup(
      "kickstart-lsp-attach",
      { clear = true }
    ),
    callback = function(event)
      -- A small helper function to simplify setting keys.
      local map = function(keys, func, desc)
        vim.keymap.set(
          "n",
          keys,
          func,
          { buffer = event.buf, desc = "LSP: " .. desc }
        )
      end

      -- Jump to the definition of the word under your cursor.
      --  This is where a variable was first declared, or where a function is defined, etc.
      --  To jump back, press <C-t>.
      map(
        "gd",
        require("telescope.builtin").lsp_definitions,
        "[G]oto [D]efinition"
      )

      -- Find references for the word under your cursor.
      map(
        "gr",
        require("telescope.builtin").lsp_references,
        "[G]oto [R]eferences"
      )

      -- Jump to the implementation of the word under your cursor.
      --  Useful when your language has ways of declaring types without an actual implementation.
      map(
        "gI",
        require("telescope.builtin").lsp_implementations,
        "[G]oto [I]mplementation"
      )

      -- Jump to the type of the word under your cursor.
      --  Useful when you're not sure what type a variable is and you want to see
      --  the definition of its *type*, not where it was *defined*.
      map(
        "<leader>D",
        require("telescope.builtin").lsp_type_definitions,
        "Type [D]efinition"
      )

      -- Fuzzy find all the symbols in your current document.
      --  Symbols are things like variables, functions, types, etc.
      map(
        "<leader>ds",
        require("telescope.builtin").lsp_document_symbols,
        "[D]ocument [S]ymbols"
      )

      -- Fuzzy find all the symbols in your current workspace.
      --  Similar to document symbols, except searches over your entire project.
      map(
        "<leader>ws",
        require("telescope.builtin").lsp_dynamic_workspace_symbols,
        "[W]orkspace [S]ymbols"
      )

      -- Rename the variable under your cursor.
      --  Most Language Servers support renaming across files, etc.
      map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

      -- Execute a code action, usually your cursor needs to be on top of an error
      -- or a suggestion from your LSP for this to activate.
      map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

      -- WARN: This is not Goto Definition, this is Goto Declaration.
      --  For example, in C this would take you to the header.
      map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

      -- Format current buffer.
      map(
        "<leader>f",
        '<cmd>lua vim.lsp.buf.format({ async = true, filter = function(client) return client.name ~= "typescript-tools" end, })<cr>',
        "[F]ormat"
      )

      -- The following two autocommands are used to highlight references of the
      -- word under your cursor when your cursor rests there for a little while.
      --    See `:help CursorHold` for information about when this is executed
      --
      -- When you move your cursor, the highlights will be cleared (the second autocommand).
      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if
        client
        and client.supports_method(
          vim.lsp.protocol.Methods.textDocument_documentHighlight
        )
      then
        local highlight_augroup = vim.api.nvim_create_augroup(
          "kickstart-lsp-highlight",
          { clear = false }
        )
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd("LspDetach", {
          group = vim.api.nvim_create_augroup(
            "kickstart-lsp-detach",
            { clear = true }
          ),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({
              group = "kickstart-lsp-highlight",
              buffer = event2.buf,
            })
          end,
        })
      end

      -- The following code creates a keymap to toggle inlay hints in your
      -- code, if the language server you are using supports them
      --
      -- This may be unwanted, since they displace some of your code
      if
        client
        and client.supports_method(
          vim.lsp.protocol.Methods.textDocument_inlayHint
        )
      then
        map("<leader>th", function()
          vim.lsp.inlay_hint.enable(
            not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })
          )
        end, "[T]oggle Inlay [H]ints")
      end
    end,
  })

  -- LSP servers and clients are able to communicate to each other what features they support.
  --  By default, Neovim doesn't support everything that is in the LSP specification.
  --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
  --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend(
    "force",
    capabilities,
    require("cmp_nvim_lsp").default_capabilities()
  )

  local lspconfig = require("lspconfig")

  -- Enable the following language servers
  local servers = {
    "lua_ls",
    -- "jsonls",
    -- "yamlls",
    -- "pyright",
    -- "ruff",
    -- "pylsp",
    -- "lemminx",
    -- "clangd",
    -- "cmake",
  }

  for _, server in pairs(servers) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "user.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
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
