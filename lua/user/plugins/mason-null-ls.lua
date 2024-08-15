local M = {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",
  },
}

function M.config()
  local cfg = {
    ensure_installed = {
      "black",
      -- "clang-format",
      -- "cmakelang",
      "jq",
      "prettier",
      "stylua",
      "xmlformatter",
      "yamllint",
      "sql-formatter",
    },
  }

  require("mason-null-ls").setup(cfg)
end

return M
