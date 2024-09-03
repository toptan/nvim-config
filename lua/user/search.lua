local P = require("project_nvim.utils.history")

local M = {}

local function cb_recent_projects(item)
  vim.cmd("cd " .. item)
  MiniPick.builtin.files()
  return false
end

function M.recent_projects()
  local results = P.get_recent_projects()
  local opts = {
    source = {
      items = results,
      name = "Recent projects",
      choose = cb_recent_projects,
    },
  }
  require("mini.pick").start(opts)
end

local function cb_todo_chosen(item)
  vim.schedule(function()
    vim.cmd("edit " .. item.filename .. " | " .. item.lnum)
  end)
  return false
end

local function cb_todo_results(results)
  local opts = {
    source = {
      items = results,
      name = "ToDo comments",
      choose = cb_todo_chosen,
    },
  }
  require("mini.pick").start(opts)
end

function M.todos()
  require("todo-comments.search").search(cb_todo_results, {})
end

return M
