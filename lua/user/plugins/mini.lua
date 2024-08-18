local M = {
  "echasnovski/mini.nvim",
  version = false,
  lazy = false,
}

local function header_func()
  local hour = tonumber(vim.fn.strftime("%H"))
  -- [04:00, 12:00) - morning, [12:00, 20:00) - day, [20:00, 04:00) - evening
  local part_id = math.floor((hour + 4) / 8) + 1
  local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
  local username = vim.loop.os_get_passwd()["username"] or "USERNAME"

  return ("Good %s, %s!\n\nWhere there is a shell, there is a way."):format(day_part, username)
end

local function footer_func()
  return
       "The computer scientist's main challenge is not to\n"
    .. "get confused by the complexities of his own making.\n"
    .. "\n"
    .. "                              -- Edsger W. Dijkstra"
end

function M.config()
  -- Set up mini.icons and mock nvim-web-devicons.
  require("mini.icons").setup()
  MiniIcons.mock_nvim_web_devicons()

  -- Better Around/Inside textobjects
  --
  -- Examples:
  --  - va)  - [V]isually select [A]round [)]paren
  --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
  --  - ci'  - [C]hange [I]nside [']quote
  require("mini.ai").setup({ n_lines = 500 })

  -- Add/delete/replace surroundings (brackets, quotes, etc.)
  --
  -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
  -- - sd'   - [S]urround [D]elete [']quotes
  -- - sr)'  - [S]urround [R]eplace [)] [']
  require("mini.surround").setup()

  -- Simple and easy statusline.
  --  You could remove this setup call if you don't like it,
  --  and try some other statusline plugin
  local statusline = require("mini.statusline")
  -- set use_icons to true if you have a Nerd Font
  statusline.setup({ use_icons = vim.g.have_nerd_font })

  -- You can configure sections in the statusline by overriding their
  -- default behavior. For example, here we set the section for
  -- cursor location to LINE:COLUMN
  ---@diagnostic disable-next-line: duplicate-set-field
  statusline.section_location = function()
    return "%2l:%-2v"
  end

  local starter_opts = {
    header = header_func(),
    footer = footer_func(),
  }

  require("mini.starter").setup(starter_opts)
end

return M
