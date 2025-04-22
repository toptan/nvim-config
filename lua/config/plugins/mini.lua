local setup_statusline = function()
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

    return MiniStatusline.combine_groups({
      { hl = mode_hl,                  strings = { mode } },
      {
        hl = "MiniStatuslineDevinfo",
        strings = { git, diff, diagnostics, lsp },
      },
      "%<", -- Mark general truncate point
      { hl = "MiniStatuslineFilename", strings = { filename } },
      "%=", -- End left alignment
      { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
      { hl = mode_hl,                  strings = { search, location } },
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

local setup_starter = function()
  local function header_func()
    local hour = tonumber(vim.fn.strftime("%H"))
    -- [04:00, 12:00) - morning, [12:00, 20:00) - day, [20:00, 04:00) - evening
    local part_id = math.floor((hour + 4) / 8) + 1
    local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
    local username = vim.uv.os_get_passwd()["username"] or "USERNAME"

    return ("Good %s, %s!\n\nWhere there is a shell, there is a way."):format(day_part, username)
  end

  local function footer_func()
    return "The computer scientist's main challenge is not to\n"
        .. "get confused by the complexities of his own making.\n"
        .. "\n"
        .. "                              -- Edsger W. Dijkstra"
  end

  local options = {
    header = header_func,
    footer = footer_func,
  }

  require("mini.starter").setup(options)
end

local setup_clue = function()
  local options = {
    triggers = {
      -- Leader triggers
      { mode = "n", keys = "<leader>" },
      { mode = "x", keys = "<leader>" },

      -- 'g' key
      { mode = "n", keys = "g" },
      { mode = "x", keys = "g" },
    },

    clues = {
      { mode = "n", keys = "<leader>f", desc = "+[F]iles" },
      { mode = "n", keys = "<leader>b", desc = "+[B]uffers" },
      { mode = "n", keys = "<leader>g", desc = "+[G]it" },
      { mode = "n", keys = "<leader>c", desc = "+[C]ode" },
      { mode = "n", keys = "<leader>t", desc = "+[T]oggle" },
      { mode = "n", keys = "<leader>l", desc = "+[L]SP" },
      { mode = "n", keys = "<leader>s", desc = "+[S]earch" },
    },
  }
  require("mini.clue").setup(options)
end

return {
  {
    'echasnovski/mini.nvim',
    version = false,
    enabled = true,
    config = function()
      setup_statusline()
      setup_starter()
      setup_clue()
    end
  },
}
