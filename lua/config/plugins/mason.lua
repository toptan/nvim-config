local install_required_packages = function()
  local registry = require("mason-registry")
  local required = {
    "bash-language-server",
    "lua-language-server",
    "neocmakelsp",
    "shellcheck",
  }

  for _, pkg_name in ipairs(required) do
    if not registry.is_installed(pkg_name) then
      local pkg = registry.get_package(pkg_name)
      vim.schedule(function() pkg:install() end)
    end
  end
end

return {
  "williamboman/mason.nvim",
  version = false,
  config = function()
    local options = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    }
    require("mason").setup(options)
    require("mason-registry").refresh(install_required_packages)
  end
}
