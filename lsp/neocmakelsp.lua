local capabilities = require("mini.completion").get_lsp_capabilities()
capabilities["workspace"] = {
  didChangeWatchedFiles = {
    dynamicRegistration = true,
    relative_pattern_support = true,
  },
}

return {
  cmd = { "neocmakelsp", "--stdio" },
  filetypes = { "cmake" },
  single_file_support = true,
  init_options = {
    format = {
      enable = true,
    },
    lint = {
      enable = true,
    },
    scan_cmake_in_package = true,
    semantic_token = false,
  },
  capabilities = capabilities,
}
