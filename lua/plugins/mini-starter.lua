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

return {
  "nvim-mini/mini.starter",
  version = false,
  opts = {
    header = header_func,
    footer = footer_func,
    query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_.",
  },
}
