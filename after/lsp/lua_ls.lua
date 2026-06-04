return {
    on_attach = function(client, buf_id)
        -- Reduce very long list of triggers for better 'mini.completion' experience
        client.server_capabilities.completionProvider.triggerCharacters = { ".", ":", "#", "(" }
        -- Use this function to define buffer-local mappings and behavior that depend
        -- on attached client or only makes sense if there is language server attached.
    end,
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    -- LuaLS Structure of these settings comes from LuaLS, not Neovim
    settings = {
        Lua = {
            -- Define runtime properties. Use 'LuaJIT', as it is built into Neovim.
            runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
            workspace = {
                -- Analyze code from submodules
                ignoreSubmodules = false,
                -- Add Neovim's methods for easier code writing
                library = vim.list_extend(
                    -- full runtime + plugins
                    vim.api.nvim_get_runtime_file("", true),
                    -- explicit VIMRUNTIME too
                    { vim.env.VIMRUNTIME }
                ),
                -- suppress "Do you need to configure..." prompts
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
