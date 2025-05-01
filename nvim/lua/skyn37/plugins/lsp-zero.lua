return {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },
    config = function()
        -- Load and configure lsp-zero
        local lsp_zero = require('lsp-zero')

        lsp_zero.on_attach(function(client, bufnr)
            local opts = { buffer = bufnr, remap = false }

            -- Keymaps for LSP functionality
            vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
            vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
            vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
            vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
            vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
            vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
            vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
            vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
            vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
            vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        end)

        -- Configure Mason
        require('mason').setup({})
        require('mason-lspconfig').setup({
            ensure_installed = {'ts_ls', 'rust_analyzer', 'clangd', 'html', 'lua_ls'},
            handlers = {
                lsp_zero.default_setup,
                lua_ls = function()
                    local lua_opts = lsp_zero.nvim_lua_ls()
                    require('lspconfig').lua_ls.setup(lua_opts)
                end,
                clangd = function()
                    require('lspconfig').clangd.setup({
                        cmd = { 
                            "clangd", 
                            "--background-index",  -- Enable faster symbol searching
                            "--clang-tidy",        -- Enable clang-tidy for warnings
                            "--completion-style=detailed", -- Better autocompletion
                            "--header-insertion=never",   -- Prevents slow automatic header insertion
                            "--pch-storage=memory"        -- Speeds up precompiled headers
                        },
                        on_attach = function(client, bufnr)
                            -- Delay diagnostics to avoid running on every keystroke
                            vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
                                config = config or {}
                                config.update_in_insert = false -- Don't update diagnostics while typing
                                config.severity_sort = true -- Sort by severity
                                return vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
                            end
                        end,
                        capabilities = lsp_zero.capabilities
                    })
                end,
            },
        })

        -- Configure nvim-cmp
        local cmp = require('cmp')
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        cmp.setup({
            sources = {
                { name = 'path' },
                { name = 'nvim_lsp' },
                { name = 'nvim_lua' },
                { name = 'luasnip', keyword_length = 2 },
                { name = 'buffer', keyword_length = 3 },
            },
            formatting = lsp_zero.cmp_format(),
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),
        })
    end,
}

