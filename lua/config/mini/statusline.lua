local active_content = function()
  local mode, mode_hl = require("mini.statusline").section_mode({ trunc_width = 120 })
  local git = require("mini.statusline").section_git({ trunc_width = 40 })
  local diff = require("mini.statusline").section_diff({ trunc_width = 75 })
  local diagnostics = require("mini.statusline").section_diagnostics({ trunc_width = 75 })
  local lsp = require("mini.statusline").section_lsp({ trunc_width = 75 })
  local filename = require("mini.statusline").section_filename({ trunc_width = 140 })
  local fileinfo = require("mini.statusline").section_fileinfo({ trunc_width = 120 })
  local location = require("mini.statusline").section_location({ trunc_width = 75 })
  local search = require("mini.statusline").section_searchcount({ trunc_width = 75 })
  local OS_UNAME = vim.uv.os_uname()

  local function getOsIcon()
    local uname = OS_UNAME.sysname
    if uname:match("Darwin") then
      return ""
    elseif uname:match("Windows") then
      return ""
    elseif uname:match("Linux") then
      return ""
    else
      return "󱚟"
    end
  end

  return require("mini.statusline").combine_groups({
    { hl = mode_hl, strings = { mode } },
    {
      hl = "MiniStatuslineDevinfo",
      strings = { git, diff, diagnostics, lsp },
    },
    "%<", -- Mark general truncate point
    { hl = "MiniStatuslineFilename", strings = { filename } },
    "%=", -- End left alignment
    { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
    { hl = mode_hl, strings = { search, location } },
    { hl = "MiniStatuslineInactive", strings = { getOsIcon() } },
  })
end

local M = {}

function M.setup()
  local opts = {
    -- Content of statusline as functions which return statusline string. See
    -- `:h statusline` and code of default contents (used instead of `nil`).
    content = {
      -- Content for active window
      active = active_content,
      -- Content for inactive window(s)
      inactive = nil,
    },
    use_icons = true,

    -- Whether to set Vim's settings for statusline (make it always shown)
    set_vim_settings = false,
  }

  require("mini.statusline").setup(opts)
end

return M
