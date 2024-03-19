return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",

        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",

        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "gopls",
                "rust_analyzer",
            },
            handlers = {
                function(server_name)  -- default handler (optional)
                    require("lspconfig")[server_name].setup {}
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,
            }
        })
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)  -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' }, -- For luasnip users.
            }, {
                {
                    name = 'buffer' },
            })
        })
    end
}
-- \
-- \    {
-- \        'VonHeikemen/lsp-zero.nvim',
-- \        branch = 'v3.x',
-- \        lazy = true,
-- \        config = false,
-- \        init = function()
-- \            -- Disable automatic setup, we are doing it manually
-- \            vim.g.lsp_zero_extend_cmp = 0
-- \            vim.g.lsp_zero_extend_lspconfig = 0
-- \        end,
-- \    },
-- \
-- \    -- Automatic LSP setup
-- \    {
-- \        'williamboman/mason.nvim',
-- \        lazy = false,
-- \        config = true,
-- \    },
-- \
-- \    -- Autocompletion
-- \    {
-- \        'hrsh7th/nvim-cmp',
-- \        event = 'InsertEnter',
-- \        dependencies = {
-- \            { 'L3MON4D3/LuaSnip' },
-- \        },
-- \        config = function()
-- \            -- Here is where you configure the autocompletion settings.
-- \            local lsp_zero = require('lsp-zero')
-- \            lsp_zero.extend_cmp()
-- \
-- \            -- And you can configure cmp even more, if you want to.
-- \            local cmp = require('cmp')
-- \            local cmp_action = lsp_zero.cmp_action()
-- \
-- \            cmp.setup({
-- \                formatting = lsp_zero.cmp_format({ details = true }),
-- \                mapping = cmp.mapping.preset.insert({
-- \                    ['<C-Space>'] = cmp.mapping.complete(),
-- \                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
-- \                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
-- \                    -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
-- \                    -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),
-- \                })
-- \            })
-- \        end
-- \    },
-- \
-- \    -- LSP
-- \    {
-- \        'neovim/nvim-lspconfig',
-- \        cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
-- \        event = { 'BufReadPre', 'BufNewFile' },
-- \        dependencies = {
-- \            { 'hrsh7th/cmp-nvim-lsp' },
-- \            { 'williamboman/mason-lspconfig.nvim' },
-- \            { "towolf/vim-helm",                  ft = "helm" },
-- \        },
-- \        config = function()
-- \            -- This is where all the LSP shenanigans will live
-- \            local lsp_zero = require('lsp-zero')
-- \            lsp_zero.extend_lspconfig()
-- \
-- \            --- if you want to know more about lsp-zero and mason.nvim
-- \            --- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guides/integrate-with-mason-nvim.md
-- \            lsp_zero.on_attach(function(client, bufnr)
-- \                local map = vim.keymap.set
-- \                local opts = { buffer = bufnr, remap = false }
-- \
-- \               vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
-- \                vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
-- \                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
-- \                vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
-- \                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
-- \                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
-- \                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
-- \                vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
-- \                vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
-- \                vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
-- \                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
-- \                vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format() end)
-- \
-- \
-- \                -- see :help lsp-zero-keybindings
-- \                -- -- to learn the available actions
-- \                --lsp_zero.default_keymaps({ buffer = bufnr })
-- \            end)
-- \
-- \            require('mason-lspconfig').setup({
-- \                ensure_installed = {},
-- \                handlers = {
-- \                    lsp_zero.default_setup,
-- \                    lua_ls = function()
-- \                        -- (Optional) Configure lua language server for neovim
-- \                        local lua_opts = lsp_zero.nvim_lua_ls()
-- \                        require('lspconfig').lua_ls.setup(lua_opts)
-- \                    end,
-- \                }
-- \            })
-- \
-- \            -- HELM language server setup
-- \            require("lspconfig")["helm_ls"].setup({
-- \                settings = {
-- \                    ['helm-ls'] = {
-- \                        valuesFiles = {
-- \                            mainValuesFile = "values.yaml",
-- \                            additionalValuesFilesGlobPattern = "values.*.yaml",
-- \                        },
-- \                        yamlls = {
-- \                            path = "yaml-language-server",
-- \                        }
-- \                    }
-- \                }
-- \            })
-- \        end
-- \    },
-- \
-- \}
