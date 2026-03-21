local misc = require("mini.misc")

local now = function(f)
  require("mini.misc").safely("now", f)
end
local later = function(f)
  misc.safely("later", f)
end

local function setup_mini_starter()
  local function header_func()
    local hour = tonumber(vim.fn.strftime("%H"))
    -- [04:00, 12:00) - morning, [12:00, 20:00) - day, [20:00, 04:00) - evening
    local part_id = math.floor((hour + 4) / 8) + 1
    local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
    local username = os.getenv("USER") or os.getenv("LOGNAME")

    return ("Good %s, %s!\n\nWhere there is a shell, there is a way."):format(day_part, username)
  end

  local function footer_func()
    return "The computer scientist's main challenge is not to\n"
      .. "get confused by the complexities of his own making.\n"
      .. "\n"
      .. "                              -- Edsger W. Dijkstra"
  end

  require("mini.starter").setup({
    header = header_func,
    footer = footer_func,
    query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_.",
  })
end

local function setup_mini_icons()
  -- Set up to not prefer extension-based icon for some extensions
  local ext3_blocklist = { scm = true, txt = true, yml = true }
  local ext4_blocklist = { json = true, yaml = true }
  require("mini.icons").setup({
    use_file_extension = function(ext, _)
      return not (ext3_blocklist[ext:sub(-3)] or ext4_blocklist[ext:sub(-4)])
    end,
  })

  -- Mock 'nvim-tree/nvim-web-devicons' for plugins without 'mini.icons' support.
  -- Not needed for 'mini.nvim' or MiniMax, but might be useful for others.
  later(MiniIcons.mock_nvim_web_devicons)

  -- Add LSP kind icons. Useful for 'mini.completion'.
  later(MiniIcons.tweak_lsp_kind)
end

local function setup_mini_clue()
  local leader_group_clues = {
    { mode = "n", keys = "<Leader>b", desc = "+Buffer" },
    { mode = "n", keys = "<Leader>c", desc = "+Code" },
    { mode = "n", keys = "<Leader>e", desc = "+Explore/Edit" },
    { mode = "n", keys = "<Leader>f", desc = "+Find" },
    { mode = "n", keys = "<Leader>g", desc = "+Git" },
    { mode = "n", keys = "<Leader>l", desc = "+Language" },
    { mode = "n", keys = "<Leader>m", desc = "+Map" },
    { mode = "n", keys = "<Leader>o", desc = "+Other" },
    { mode = "n", keys = "<Leader>s", desc = "+Session" },
    { mode = "n", keys = "<Leader>t", desc = "+Terminal" },
    { mode = "n", keys = "<Leader>v", desc = "+Visits" },

    { mode = "x", keys = "<Leader>g", desc = "+Git" },
    { mode = "x", keys = "<Leader>l", desc = "+Language" },
  }

  local miniclue = require("mini.clue")
  miniclue.setup({
    -- Define which clues to show. By default shows only clues for custom mappings
    -- (uses `desc` field from the mapping; takes precedence over custom clue).
    clues = {
      leader_group_clues,
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.square_brackets(),
      -- This creates a submode for window resize mappings. Try the following:
      -- - Press `<C-w>s` to make a window split.
      -- - Press `<C-w>+` to increase height. Clue window still shows clues as if
      --   `<C-w>` is pressed again. Keep pressing just `+` to increase height.
      --   Try pressing `-` to decrease height.
      -- - Stop submode either by `<Esc>` or by any key that is not in submode.
      miniclue.gen_clues.windows({ submode_resize = true }),
      miniclue.gen_clues.z(),
    },
    -- Explicitly opt-in for set of common keys to trigger clue window
    triggers = {
      { mode = { "n", "x" }, keys = "<Leader>" }, -- Leader triggers
      { mode = "n", keys = "\\" }, -- mini.basics
      { mode = { "n", "x" }, keys = "[" }, -- mini.bracketed
      { mode = { "n", "x" }, keys = "]" },
      { mode = "i", keys = "<C-x>" }, -- Built-in completion
      { mode = { "n", "x" }, keys = "g" }, -- `g` key
      { mode = { "n", "x" }, keys = "'" }, -- Marks
      { mode = { "n", "x" }, keys = "`" },
      { mode = { "n", "x" }, keys = '"' }, -- Registers
      { mode = { "i", "c" }, keys = "<C-r>" },
      { mode = "n", keys = "<C-w>" }, -- Window commands
      { mode = { "n", "x" }, keys = "s" }, -- `s` key (mini.surround, etc.)
      { mode = { "n", "x" }, keys = "z" }, -- `z` key
    },
  })
end

now(setup_mini_starter)
now(setup_mini_icons)
later(setup_mini_clue)

