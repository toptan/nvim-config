local function init_clues()
  local miniclue = require("mini.clue")
  local opts = {
    window = {
      config = { width = "auto" },
    },
    triggers = {
      -- Leader triggers
      { mode = "n", keys = "<leader>" },
      { mode = "x", keys = "<leader>" },

      -- Built-in completion
      { mode = "i", keys = "<C-x>" },

      -- `g` key
      { mode = "n", keys = "g" },
      { mode = "x", keys = "g" },

      -- Marks
      { mode = "n", keys = "'" },
      { mode = "n", keys = "`" },
      { mode = "x", keys = "'" },
      { mode = "x", keys = "`" },

      -- Registers
      { mode = "n", keys = '"' },
      { mode = "x", keys = '"' },
      { mode = "i", keys = "<C-r>" },
      { mode = "c", keys = "<C-r>" },

      -- Window commands
      { mode = "n", keys = "<C-w>" },

      -- `z` key
      { mode = "n", keys = "z" },
      { mode = "x", keys = "z" },
    },

    clues = {
      -- Enhance this by adding descriptions for <leader> mapping groups
      miniclue.gen_clues.builtin_completion(),
      miniclue.gen_clues.g(),
      miniclue.gen_clues.marks(),
      miniclue.gen_clues.registers(),
      miniclue.gen_clues.windows(),
      miniclue.gen_clues.z(),

      { mode = "n", keys = "<leader>b", desc = "+[B]uffers" },
      { mode = "n", keys = "<leader>c", desc = "+[C]ode" },
      { mode = "n", keys = "<leader>f", desc = "+[F]ind" },
      { mode = "n", keys = "<leader>g", desc = "+[G]it" },
      { mode = "n", keys = "<leader>s", desc = "+[S]earch" },
      { mode = "n", keys = "<leader>t", desc = "+[T]oggle" },
      { mode = "n", keys = "<leader>m", desc = "+[M]isc" },
    },
  }
  miniclue.setup(opts)
end

return {
  {
    "nvim-mini/mini.clue",
    version = false,
    init = init_clues,
  },
}
