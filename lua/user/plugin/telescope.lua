local M = {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
    { "stevearc/aerial.nvim" },
  },
}

function M.config()
  local wk = require("which-key")
  local mappings = {
    { "<leader>sb", "<cmd>Telescope buffers<cr>", desc = "[B]uffers" },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "[C]olorschemes" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "[F]iles" },
    {
      "<leader>sp",
      "<cmd>lua require('telescope').extensions.projects.projects()<cr>",
      desc = "[P]rojects",
    },
    { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "[T]ext" },
  }
  wk.add(mappings)

  local actions = require("telescope.actions")
  local options = {
    defaults = {
      color_devicons = true,
      path_display = { "smart" },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      buffers = {
        theme = "dropdown",
        previewer = true,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },
      colorscheme = {
        enable_preview = true,
      },
      find_files = {
        theme = "dropdown",
        previewer = true,
      },
      live_grep = {
        theme = "dropdown",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      aerial = {
        format_symbol = function(symbol_path, filetype)
          if filetype == "json" or filetype == "yaml" then
            return table.concat(symbol.path, ".")
          else
            return symbol_path[#symbol_path]
          end
        end,
        show_colums = "both",
      },
    },
  }

  require("telescope").setup(options)
  require("telescope").load_extension("aerial")
end

return M
