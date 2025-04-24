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
  single_file_support = true, -- suggested
  init_options = {
    format = {
      enable = true
    },
    lint = {
      enable = true
    },
    scan_cmake_in_package = true, -- default is true
    semantic_token = false,
  },
  capabilities = require("mini.completion").get_lsp_capabilities()
}
