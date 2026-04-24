-- Make concise helpers for installing/adding plugins in two stages
local add = vim.pack.add
local now_if_args, later = Config.now_if_args, Config.later

later(function()
    add({ "https://github.com/stevearc/conform.nvim" })

    -- See also:
    -- - `:h Conform`
    -- - `:h conform-options`
    -- - `:h conform-formatters`
    require("conform").setup({
        default_format_opts = {
            -- Allow formatting from LSP server if no dedicated formatter is available
            lsp_format = "fallback",
        },
        -- Map of filetype to formatters
        -- Make sure that necessary CLI tool is available
        formatters_by_ft = { lua = { "stylua" } },
    })
end)
