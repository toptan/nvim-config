local M = {}

function M.config()
  local activeContent = function()
    local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
    local git = MiniStatusline.section_git({ trunc_width = 40 })
    local diff = MiniStatusline.section_diff({ trunc_width = 75 })
    local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
    local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
    local filename = MiniStatusline.section_filename({ trunc_width = 140 })
    local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
    local location = MiniStatusline.section_location({ trunc_width = 75 })
    local search = MiniStatusline.section_searchcount({ trunc_width = 75 })
    local OS_UNAME = vim.loop.os_uname()

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

    return MiniStatusline.combine_groups({
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

  local options = {
    -- Content of statusline as functions which return statusline string. See
    -- `:h statusline` and code of default contents (used instead of `nil`).
    content = {
      -- Content for active window
      active = activeContent,
      -- Content for inactive window(s)
      inactive = nil,
    },
    use_icons = true,

    -- Whether to set Vim's settings for statusline (make it always shown)
    set_vim_settings = false,
  }
  require("mini.statusline").setup(options)
end

return M
