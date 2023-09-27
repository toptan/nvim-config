local null_ls_status_ok, null_ls = pcall(require, "null-ls")

if not null_ls_status_ok then
    vim.notify("Failed to initialize null-ls plugin. Check your configuration.")
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
    },
})

