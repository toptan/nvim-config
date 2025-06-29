local M = {}

function M.setup()
  local opts = {
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
  require("mini.clue").setup(opts)
end

return M
