return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  config = function ()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "asm",
        "bash",
        "c",
        "cmake",
        "comment",
        "cpp",
        "dockerfile",
        "editorconfig",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "printf",
        "regex",
        "ssh_config",
        "tmux",
        "toml",
        "yaml",
      }
    })
  end,
  build = ":TSUpdate"
}
