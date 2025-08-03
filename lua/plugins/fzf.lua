return {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    opts = {},
    keys={
        { 
            "<leader>ff",
            function() require('fzf-lua').files() end,
            desc="[F]iles in project directory"
        },
        { 
            "<leader>fg",
            function() require('fzf-lua').live_grep() end,
            desc="By [g]repping in project directory"
        },
        { 
            "<leader>fc",
            function() require('fzf-lua').files({cwd=vim.fn.stdpath("config")}) end,
            desc="Neovim [c]onfiguration"
        },
        {
            "<leader>fh",
            function()
                require("fzf-lua").helptags()
            end,
            desc = "[H]elp",
        },
        {
            "<leader>fk",
            function()
                require("fzf-lua").keymaps()
            end,
            desc = "[K]eymaps",
        },
        {
            "<leader>fb",
            function()
                require("fzf-lua").builtin()
            end,
            desc = "[B]uiltin FZF",
        },
        {
            "<leader>fw",
            function()
                require("fzf-lua").grep_cword()
            end,
            desc = "[w]ord",
        },
        {
            "<leader>fW",
            function()
                require("fzf-lua").grep_cWORD()
            end,
            desc = "[W]ORD",
        },
        {
            "<leader>fd",
            function()
                require("fzf-lua").diagnostics_document()
            end,
            desc = "[D]iagnostics",
        },
        {
            "<leader>fr",
            function()
                require("fzf-lua").resume()
            end,
            desc = "[R]esume",
        },
        {
            "<leader>fo",
            function()
                require("fzf-lua").oldfiles()
            end,
            desc = "[O]ld Files",
        },
        {
            "<leader><leader>",
            function()
                require("fzf-lua").buffers()
            end,
            desc = "[ ] Existing buffers",
        },
        {
            "<leader>/",
            function()
                require("fzf-lua").lgrep_curbuf()
            end,
            desc = "[/] Live grep the current buffer",
        },
    }
}
