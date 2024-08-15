local M = {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
}

function M.config()
  local opts = {
    ensure_installed = {
      "lua",
      "markdown",
      "markdown_inline",
      "bash",
      "python",
      "cpp",
    },
    highlight = { enable = true },
    indent = { enable = true },
  }
  require("nvim-treesitter.configs").setup(opts)
end

return M
