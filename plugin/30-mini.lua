local now, now_if_args, later = Config.now, Config.now_if_args, Config.later

now(function()
    require("mini.basics").setup({
        -- Manage options in 'plugin/10_options.lua' for didactic purposes
        options = { basic = false },
        mappings = {
            -- Create `<C-hjkl>` mappings for window navigation
            windows = true,
            -- Create `<M-hjkl>` mappings for navigation in Insert and Command modes
            move_with_alt = true,
        },
    })
end)

now(function()
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
end)

now(function()
    require("mini.notify").setup()
end)

-- Session management. A thin wrapper around `:h mksession` that consistently
-- manages session files. Example usage:
-- - `<Leader>sn` - start new session
-- - `<Leader>sr` - read previously started session
-- - `<Leader>sd` - delete previously started session
now(function()
    require("mini.sessions").setup()
end)

now(function()
    local function header_func()
        local hour = tonumber(vim.fn.strftime("%H"))
        -- [04:00, 12:00) - morning, [12:00, 20:00) - day, [20:00, 04:00) - evening
        local part_id = math.floor((hour + 4) / 8) + 1
        local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
        local username = vim.uv.os_get_passwd()["username"] or "USERNAME"

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
end)

now(function()
    require("mini.statusline").setup()
end)

now_if_args(function()
    -- Customize post-processing of LSP responses for a better user experience.
    -- Don't show 'Text' suggestions (usually noisy) and show snippets last.
    local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
    local process_items = function(items, base)
        return MiniCompletion.default_process_items(items, base, process_items_opts)
    end
    require("mini.completion").setup({
        lsp_completion = {
            -- Without this config autocompletion is set up through `:h 'completefunc'`.
            -- Although not needed, setting up through `:h 'omnifunc'` is cleaner
            -- (sets up only when needed) and makes it possible to use `<C-u>`.
            source_func = "omnifunc",
            auto_setup = false,
            process_items = process_items,
        },
    })

    -- Set 'omnifunc' for LSP completion only when needed.
    local on_attach = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
    end
    Config.new_autocmd("LspAttach", nil, on_attach, "Set 'omnifunc'")

    -- Advertise to servers that Neovim now supports certain set of completion and
    -- signature features through 'mini.completion'.
    vim.lsp.config("*", { capabilities = MiniCompletion.get_lsp_capabilities() })
end)

later(function()
    local miniclue = require("mini.clue")
  -- stylua: ignore
  miniclue.setup({
    -- Define which clues to show. By default shows only clues for custom mappings
    -- (uses `desc` field from the mapping; takes precedence over custom clue).
    clues = {
      -- This is defined in 'plugin/20_keymaps.lua' with Leader group descriptions
      Config.leader_group_clues,
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
      { mode = { 'n', 'x' }, keys = '<Leader>' }, -- Leader triggers
      { mode =   'n',        keys = '\\' },       -- mini.basics
      { mode = { 'n', 'x' }, keys = '[' },        -- mini.bracketed
      { mode = { 'n', 'x' }, keys = ']' },
      { mode =   'i',        keys = '<C-x>' },    -- Built-in completion
      { mode = { 'n', 'x' }, keys = 'g' },        -- `g` key
      { mode = { 'n', 'x' }, keys = "'" },        -- Marks
      { mode = { 'n', 'x' }, keys = '`' },
      { mode = { 'n', 'x' }, keys = '"' },        -- Registers
      { mode = { 'i', 'c' }, keys = '<C-r>' },
      { mode =   'n',        keys = '<C-w>' },    -- Window commands
      { mode = { 'n', 'x' }, keys = 's' },        -- `s` key (mini.surround, etc.)
      { mode = { 'n', 'x' }, keys = 'z' },        -- `z` key
    },
  })
end)

-- Command line tweaks. Improves command line editing with:
-- - Autocompletion. Basically an automated `:h cmdline-completion`.
-- - Autocorrection of words as-you-type. Like `:W`->`:w`, `:lau`->`:lua`, etc.
-- - Autopeek command range (like line number at the start) as-you-type.
-- later(function()
--     require("mini.cmdline").setup()
-- end)

now_if_args(function()
    -- Enable directory/file preview
    require("mini.files").setup({ windows = { preview = true } })

    -- Add common bookmarks for every explorer. Example usage inside explorer:
    -- - `'c` to navigate into your config directory
    -- - `g?` to see available bookmarks
    local add_marks = function()
        MiniFiles.set_bookmark("c", vim.fn.stdpath("config"), { desc = "Config" })
        local vimpack_plugins = vim.fn.stdpath("data") .. "/site/pack/core/opt"
        MiniFiles.set_bookmark("p", vimpack_plugins, { desc = "Plugins" })
        MiniFiles.set_bookmark("w", vim.fn.getcwd, { desc = "Working directory" })
    end
    Config.new_autocmd("User", "MiniFilesExplorerOpen", add_marks, "Add bookmarks")
end)

now_if_args(function()
    -- Makes `:h MiniMisc.put()` and `:h MiniMisc.put_text()` public
    require("mini.misc").setup()

    -- Change current working directory based on the current file path. It
    -- searches up the file tree until the first root marker ('.git' or 'Makefile')
    -- and sets their parent directory as a current directory.
    -- This is helpful when simultaneously dealing with files from several projects.
    MiniMisc.setup_auto_root()

    -- Restore latest cursor position on file open
    MiniMisc.setup_restore_cursor()

    -- Synchronize terminal emulator background with Neovim's background to remove
    -- possibly different color padding around Neovim instance
    MiniMisc.setup_termbg_sync()
end)

-- Extra 'mini.nvim' functionality.
--
-- See also:
-- - `:h MiniExtra.pickers` - pickers. Most are mapped in `<Leader>f` group.
--   Calling `setup()` makes 'mini.pick' respect 'mini.extra' pickers.
-- - `:h MiniExtra.gen_ai_spec` - 'mini.ai' textobject specifications
-- - `:h MiniExtra.gen_highlighter` - 'mini.hipatterns' highlighters
later(function()
    require("mini.extra").setup()
end)

-- Extend and create a/i textobjects, like `:h a(`, `:h a'`, and more).
-- Contains not only `a` and `i` type of textobjects, but also their "next" and
-- "last" variants that will explicitly search for textobjects after and before
-- cursor. Example usage:
-- - `ci)` - *c*hange *i*inside parenthesis (`)`)
-- - `di(` - *d*elete *i*inside padded parenthesis (`(`)
-- - `yaq` - *y*ank *a*round *q*uote (any of "", '', or ``)
-- - `vif` - *v*isually select *i*inside *f*unction call
-- - `cina` - *c*hange *i*nside *n*ext *a*rgument
-- - `valaala` - *v*isually select *a*round *l*ast (i.e. previous) *a*rgument
--   and then again reselect *a*round new *l*ast *a*rgument
--
-- See also:
-- - `:h text-objects` - general info about what textobjects are
-- - `:h MiniAi-builtin-textobjects` - list of all supported textobjects
-- - `:h MiniAi-textobject-specification` - examples of custom textobjects
later(function()
    local ai = require("mini.ai")
    ai.setup({
        -- 'mini.ai' can be extended with custom textobjects
        custom_textobjects = {
            -- Make `aB` / `iB` act on around/inside whole *b*uffer
            B = MiniExtra.gen_ai_spec.buffer(),
            -- For more complicated textobjects that require structural awareness,
            -- use tree-sitter. This example makes `aF`/`iF` mean around/inside function
            -- definition (not call). See `:h MiniAi.gen_spec.treesitter()` for details.
            F = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        },

        -- 'mini.ai' by default mostly mimics built-in search behavior: first try
        -- to find textobject covering cursor, then try to find to the right.
        -- Although this works in most cases, some are confusing. It is more robust to
        -- always try to search only covering textobject and explicitly ask to search
        -- for next (`an`/`in`) or last (`al`/`il`).
        -- Try this. If you don't like it - delete next line and this comment.
        search_method = "cover",
    })
end)

-- Align text interactively. Example usage:
-- - `gaip,` - `ga` (align operator) *i*nside *p*aragraph by comma
-- - `gAip` - start interactive alignment on the paragraph. Choose how to
--   split, justify, and merge string parts. Press `<CR>` to make it permanent,
--   press `<Esc>` to go back to initial state.
--
-- See also:
-- - `:h MiniAlign-example` - hands-on list of examples to practice aligning
-- - `:h MiniAlign.gen_step` - list of support step customizations
-- - `:h MiniAlign-algorithm` - how alignment is done on algorithmic level
later(function()
    require("mini.align").setup()
end)

-- Animate common Neovim actions. Like cursor movement, scroll, window resize,
-- window open, window close. Animations are done based on Neovim events and
-- don't require custom mappings.
--
-- It is not enabled by default because its effects are a matter of taste.
-- Also scroll and resize have some unwanted side effects (see `:h mini.animate`).
-- Uncomment next line (use `gcc`) to enable.
-- later(function() require('mini.animate').setup() end)

-- Go forward/backward with square brackets. Implements consistent sets of mappings
-- for selected targets (like buffers, diagnostic, quickfix list entries, etc.).
-- Example usage:
-- - `]b` - go to next buffer
-- - `[j` - go to previous jump inside current buffer
-- - `[Q` - go to first entry of quickfix list
-- - `]X` - go to last conflict marker in a buffer
--
-- See also:
-- - `:h MiniBracketed` - overall mapping design and list of targets
later(function()
    require("mini.bracketed").setup()
end)

-- Remove buffers. Opened files occupy space in tabline and buffer picker.
-- When not needed, they can be removed. Example usage:
-- - `<Leader>bw` - completely wipeout current buffer (see `:h :bwipeout`)
-- - `<Leader>bW` - completely wipeout current buffer even if it has changes
-- - `<Leader>bd` - delete current buffer (see `:h :bdelete`)
later(function()
    require("mini.bufremove").setup()
end)

-- Comment lines. Provides functionality to work with commented lines.
-- Uses `:h 'commentstring'` option to infer comment structure.
-- Example usage:
-- - `gcip` - toggle comment (`gc`) *i*inside *p*aragraph
-- - `vapgc` - *v*isually select *a*round *p*aragraph and toggle comment (`gc`)
-- - `gcgc` - uncomment (`gc`, operator) comment block at cursor (`gc`, textobject)
--
-- The built-in `:h commenting` is based on 'mini.comment'. Yet this module is
-- still enabled as it provides more customization opportunities.
later(function() require('mini.comment').setup() end)

